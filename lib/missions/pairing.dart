import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Side {
  final bool _side;

  const Side(this._side);
  Side.left() : _side = true;
  Side.right() : _side = false;

  bool isLeft() => _side;
  bool isRight() => !_side;
}

class Pair {
  final bool active;
  final int target;

  const Pair(this.active, this.target);

  @override
  bool operator ==(Object other) {
    return other is Pair && active == other.active && target == other.target;
  }
}

class PairingProvider with ChangeNotifier {
  late List<bool> _selectedLeft;
  late List<bool> _selectedRight;
  late List<Pair> _pairs;

  PairingProvider(int length, {Key? key}) {
    _selectedLeft = List.filled(length, false);
    _selectedRight = List.filled(length, false);
    _pairs = List.filled(length, const Pair(false, 0));
  }

  void setSelected(Side side, int index) {
    // Updates a selected list to either set index i to true or everything to false
    List<bool> selected = side.isLeft() ? _selectedLeft : _selectedRight;
    if (selected[index]) {
      selected[index] = false;
    } else {
      for (var k = 0; k < selected.length; k++) {
        selected[k] = k == index;
      }
    }
    side.isLeft() ? _selectedLeft = selected : _selectedRight = selected;

    if (_selectedLeft.any((element) => element) &&
        _selectedRight.any((element) => element)) {
      var l = _selectedLeft.indexOf(true);
      var r = _selectedRight.indexOf(true);

      for (var i = 0; i < _pairs.length; i++) {
        if (_pairs[i].target == r) _pairs[i] = Pair(false, r);
      }
      _pairs[l] = Pair(true, r);
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

  bool isPaired(Side side, int index) {
    if (side.isLeft()) {
      return _pairs[index].active;
    } else {
      for (var pair in _pairs) {
        if (pair == Pair(true, index)) return true;
      }
      return false;
    }
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
              primary: (side.isLeft() ? provider.left[i] : provider.right[i])
                  ? const Color.fromRGBO(151, 144, 187, 1)
                  : provider.isPaired(side, i)
                      ? Colors.green
                      : Colors.grey[400],
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

class PairingWidget extends StatefulWidget {
  final List<String> left;
  final List<String> right;

  PairingWidget({required this.left, required this.right});

  @override
  _PairingWidgetState createState() => _PairingWidgetState();
}

class _PairingPainter extends CustomPainter {
  final PairingProvider provider;
  _PairingPainter(this.provider);

  Offset calcOffset(Size size, bool side, int i) {
    // TODO: Make this less hardcoded and more adaptable
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
      for (var r = 0; r < provider.right.length; r++) {
        canvas.drawLine(
          calcOffset(size, true, l),
          calcOffset(size, false, r),
          Paint()
            ..strokeWidth = 5
            ..color = provider.pairs[l] == Pair(true, r)
                ? Colors.black
                : Color.fromARGB(0, 0, 0, 0),
        );
      }
    }
  }

  @override
  bool shouldRepaint(oldDelegate) => false;
}

class _PairingWidgetState extends State<PairingWidget> {
  List<int> links = [];

  @override
  Widget build(BuildContext context) {
    final provider = PairingProvider(widget.left.length);
    return ChangeNotifierProvider(
      create: (_) => provider,
      child: CustomPaint(
        painter: _PairingPainter(provider),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _PairingColumnWidget(widget.left, Side.left()),
            _PairingColumnWidget(widget.right, Side.right()),
          ],
        ),
      ),
    );
  }
}
