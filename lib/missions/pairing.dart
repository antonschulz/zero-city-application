import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_city/utils/Graphics.dart';

enum PairState {
  inactive,
  active,
  complete,
}

enum Side {
  left,
  right,
}

class Pair {
  final PairState state;
  final int target;

  const Pair(this.state, this.target);

  @override
  bool operator ==(Object other) {
    return other is Pair && state == other.state && target == other.target;
  }

  @override
  String toString() {
    return 'Pair: {state: $state, target: $target}';
  }
}

class PairingProvider with ChangeNotifier {
  late List<bool> _selectedLeft;
  late List<bool> _selectedRight;
  late List<Pair> _pairs;
  late final List<Pair> _correct;

  Text buttonText = Text("Testa svar",
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
  Color buttonColor = Graphics.HEAVEN;

  PairingProvider(this._correct, int length, {Key? key}) {
    _selectedLeft = List.filled(length, false);
    _selectedRight = List.filled(length, false);
    _pairs = List.filled(length, const Pair(PairState.inactive, 0));
  }

  void setSelected(Side side, int index) {
    // Updates a selected list to either set index i to true or everything to false
    // If side is "true", left is updated. If side is "false", right is updated.
    if (buttonIsCorrect(side, index)) {
      // If the selected button is already correct then don't make any changes
      return;
    }

    // If button is already selected, deselect it.
    // Otherwise deselect all others and select it.
    List<bool> selected = side == Side.left ? _selectedLeft : _selectedRight;
    if (selected[index]) {
      selected[index] = false;
    } else {
      for (var k = 0; k < selected.length; k++) {
        selected[k] = k == index;
      }
    }
    // Set the new value to the correct list
    side == Side.left ? _selectedLeft = selected : _selectedRight = selected;

    // Handle pairs if one element on each side is selected
    if (_selectedLeft.any((element) => element) &&
        _selectedRight.any((element) => element)) {
      var l = _selectedLeft.indexOf(true);
      var r = _selectedRight.indexOf(true);

      // If any other pair has the same target: remove it
      for (var i = 0; i < _pairs.length; i++) {
        if (_pairs[i].target == r) _pairs[i] = Pair(PairState.inactive, r);
      }
      // Add the new pair
      _pairs[l] = Pair(PairState.active, r);
      // Clear all selections
      _selectedLeft = List.filled(_selectedLeft.length, false);
      _selectedRight = List.filled(_selectedRight.length, false);
    } else {
      // Remove pair if selected is paired
      if (side == Side.left && _pairs[index].state == PairState.active) {
        _pairs[index] = const Pair(PairState.inactive, 0);
      } else if (side == Side.right) {
        for (var i = 0; i < _pairs.length; i++) {
          if (_pairs[i].target == index) {
            _pairs[i] = const Pair(PairState.inactive, 0);
          }
        }
      }
    }

    notifyListeners();
  }

  List<bool> get left => _selectedLeft;

  set left(newValue) {
    _selectedLeft = newValue;
    notifyListeners();
  }

  List<bool> get right => _selectedRight;

  set right(newValue) {
    _selectedRight = newValue;
    notifyListeners();
  }

  List<Pair> get pairs => _pairs;

  bool isPaired(Side side, int index) {
    if (side == Side.left) {
      return _pairs[index].state == PairState.active;
    } else {
      for (var pair in _pairs) {
        if (pair == Pair(PairState.active, index)) return true;
      }
      return false;
    }
  }

  bool isCorrect(index) {
    return _correct[index] == pairs[index];
  }

  bool buttonIsCorrect(Side side, int index) {
    if (side == Side.left) {
      return isCorrect(index);
    } else {
      for (var i = 0; i < pairs.length; i++) {
        if (pairs[i].target == index && isCorrect(i)) return true;
      }
      return false;
    }
  }

  bool get complete {
    for (var i = 0; i < _pairs.length; i++) {
      if (_pairs[i] != _correct[i]) {
        return false;
      }
    }
    return true;
  }

  Null testCorrect() {
    for (var i = 0; i < _pairs.length; i++) {
      final pair = _pairs[i];
      final correct = _correct[i];
      if (pair.state == PairState.complete) {
        continue;
      } else if (pair.state == PairState.active &&
          pair.target == correct.target) {
        _pairs[i] = Pair(PairState.complete, pair.target);
      } else {
        _pairs[i] = Pair(PairState.inactive, pair.target);
      }
    }
    if (complete) {
      buttonText = Text("G?? vidare",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold));
      buttonColor = Graphics.GREEN;
    }
    notifyListeners();
  }
}

class _PairingColumnWidget extends StatelessWidget {
  final List<String> texts;
  final Side side;

  const _PairingColumnWidget(this.texts, this.side);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PairingProvider>(context);
    List<Widget> list = [];
    for (var i = 0; i < texts.length; i++) {
      list.add(Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: 200.0,
          height: 100.0,
          child: ElevatedButton(
            child: Text(texts[i]),
            style: ElevatedButton.styleFrom(
              primary: provider.buttonIsCorrect(side, i)
                  ? Graphics.GREEN
                  : (side == Side.left ? provider.left[i] : provider.right[i])
                      ? Graphics.HEAVEN
                      : provider.isPaired(side, i)
                          ? Graphics.LILAC
                          : Graphics.OYSTER,
              onPrimary: Colors.black,
            ),
            onPressed: () => {provider.setSelected(side, i)},
          ),
        ),
      ));
    }
    return Column(children: list);
  }
}

class _PairingPainter extends CustomPainter {
  final PairingProvider provider;
  _PairingPainter(this.provider);

  Offset calcOffset(Size size, Side side, int i) {
    // TODO: Make this less hardcoded and more adaptible
    // Will break if button sizes are changed or if one column has more
    // buttons than the other.
    double xDiff =
        side == Side.left ? -(size.width / 4) + 164 : (size.width / 4) - 164;
    double x = xDiff + size.width / 2;
    double y = 65.0 + 130 * i;
    return Offset(x, y);
  }

  @override
  void paint(canvas, size) {
    for (var l = 0; l < provider.left.length; l++) {
      var pair = provider.pairs[l];
      for (var r = 0; r < provider.right.length; r++) {
        canvas.drawLine(
          calcOffset(size, Side.left, l),
          calcOffset(size, Side.right, r),
          Paint()
            ..strokeWidth = 5
            ..color = pair.state != PairState.inactive && pair.target == r
                ? Colors.black
                : Color.fromARGB(0, 0, 0, 0),
        );
      }
    }
  }

  @override
  bool shouldRepaint(oldDelegate) => false;
}

SnackBar wrongAnswer = const SnackBar(
    backgroundColor: Colors.redAccent,
    content: Text(
      "Fel svar!",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: Duration(seconds: 3));

SnackBar rightAnswer = const SnackBar(
    backgroundColor: Colors.green,
    content: Text(
      "R??tt svar!",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: Duration(seconds: 3));

class ContinueButtonWidget extends StatelessWidget {
  final Null Function() Function(BuildContext) buttonTarget;

  const ContinueButtonWidget(this.buttonTarget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<PairingProvider>().complete
            ? buttonTarget(context)()
            : context.read<PairingProvider>().testCorrect();
        ScaffoldMessenger.of(context).showSnackBar(
            context.read<PairingProvider>().complete
                ? rightAnswer
                : wrongAnswer);
      },
      child: context.watch<PairingProvider>().buttonText,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(const Size(250, 80)),
        backgroundColor: MaterialStateProperty.all<Color>(
            context.watch<PairingProvider>().buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}

class PairingWidget extends StatefulWidget {
  final List<String> left;
  final List<String> right;
  final List<Pair> correct;
  final Null Function() Function(BuildContext) buttonTarget;

  const PairingWidget(this.left, this.right, this.correct, this.buttonTarget,
      {Key? key})
      : super(key: key);

  @override
  _PairingWidgetState createState() => _PairingWidgetState();
}

class _PairingWidgetState extends State<PairingWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = PairingProvider(widget.correct, widget.left.length);
    return ChangeNotifierProvider(
      create: (_) => provider,
      child: CustomPaint(
        painter: _PairingPainter(provider),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _PairingColumnWidget(widget.left, Side.left),
                _PairingColumnWidget(widget.right, Side.right),
              ],
            ),
            const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
            ContinueButtonWidget(widget.buttonTarget),
          ],
        ),
      ),
    );
  }
}
