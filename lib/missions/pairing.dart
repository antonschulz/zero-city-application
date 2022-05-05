import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_city/utils/Graphics.dart';

enum PairState {
  inactive,
  active,
  complete,
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

  Text buttonText = Text("Testa svar");
  Color buttonColor = Graphics.HEAVEN;

  PairingProvider(this._correct, int length, {Key? key}) {
    _selectedLeft = List.filled(length, false);
    _selectedRight = List.filled(length, false);
    _pairs = List.filled(length, const Pair(PairState.inactive, 0));
  }

  void setSelected(bool side, int index) {
    // Updates a selected list to either set index i to true or everything to false
    // If side is "true", left is updated. If side is "false", right is updated.
    if (buttonIsCorrect(side, index)) {
      // If the selected button is already correct then don't make any changes
      return;
    }
    List<bool> selected = side ? _selectedLeft : _selectedRight;
    if (selected[index]) {
      selected[index] = false;
    } else {
      for (var k = 0; k < selected.length; k++) {
        selected[k] = k == index;
      }
    }
    side ? _selectedLeft = selected : _selectedRight = selected;

    if (_selectedLeft.any((element) => element) &&
        _selectedRight.any((element) => element)) {
      var l = _selectedLeft.indexOf(true);
      var r = _selectedRight.indexOf(true);

      for (var i = 0; i < _pairs.length; i++) {
        if (_pairs[i].target == r) _pairs[i] = Pair(PairState.inactive, r);
      }
      _pairs[l] = Pair(PairState.active, r);
      _selectedLeft = List.filled(_selectedLeft.length, false);
      _selectedRight = List.filled(_selectedRight.length, false);
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

  bool isPaired(bool side, int index) {
    if (side) {
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

  bool buttonIsCorrect(bool side, int index) {
    if (side) {
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
      buttonText = Text("Fortsätt till nästa uppdrag");
      buttonColor = Graphics.GREEN;
    }
    notifyListeners();
  }
}

class _PairingColumnWidget extends StatelessWidget {
  final List<String> texts;
  final bool side;

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
                  : (side ? provider.left[i] : provider.right[i])
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

  Offset calcOffset(Size size, bool side, int i) {
    // TODO: Make this less hardcoded and more adaptible
    // Will break if button sizes are changed or if one column has more
    // buttons than the other.
    double xDiff = side ? -(size.width / 4) + 164 : (size.width / 4) - 164;
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
          calcOffset(size, true, l),
          calcOffset(size, false, r),
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

class continueButtonWidget extends StatelessWidget {
  final Null Function() Function(BuildContext) buttonTarget;

  continueButtonWidget(this.buttonTarget);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<PairingProvider>().complete
            ? buttonTarget(context)()
            : context.read<PairingProvider>().testCorrect();
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

  PairingWidget(this.left, this.right, this.correct, this.buttonTarget);

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
                _PairingColumnWidget(widget.left, true),
                _PairingColumnWidget(widget.right, false),
              ],
            ),
            const Divider(height: 40, color: Color.fromRGBO(0, 0, 0, 0)),
            continueButtonWidget(widget.buttonTarget),
          ],
        ),
      ),
    );
  }
}
