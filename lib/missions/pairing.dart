import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PairingProvider with ChangeNotifier {
  late List<bool> _selectedLeft;
  late List<bool> _selectedRight;

  PairingProvider(int length, {Key? key}) {
    _selectedLeft = List.filled(length, false);
    _selectedRight = List.filled(length, false);
  }

  void setSelected(bool side, int i) {
    // Updates a selected list to either set index i to true or everything to false
    // If side is "false", left is updated. If side is "true", right is updated.
    List<bool> selected = side ? _selectedLeft : _selectedRight;
    if (selected[i]) {
      selected[i] = false;
    } else {
      for (var k = 0; k < selected.length; k++) {
        selected[k] = k == i;
      }
    }
    side ? _selectedLeft = selected : _selectedRight = selected;
    notifyListeners();
  }

  get left => _selectedLeft;

  set left(newValue) {
    _selectedLeft = newValue;
    notifyListeners();
  }

  get right => _selectedRight;

  set right(newValue) {
    _selectedRight = newValue;
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
              primary: (side ? provider.left[i] : provider.right[i])
                  ? const Color.fromRGBO(151, 144, 187, 1)
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

class _PairingWidgetState extends State<PairingWidget> {
  List<int> links = [];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PairingProvider(widget.left.length),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _PairingColumnWidget(widget.left, true),
          _PairingColumnWidget(widget.right, false),
        ],
      ),
    );
  }
}
