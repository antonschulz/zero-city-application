import 'package:flutter/material.dart';

class _PairingColumnWidget extends StatefulWidget {
  final List<String> texts;

  _PairingColumnWidget({required this.texts});

  @override
  _PairingColumnWidgetState createState() => _PairingColumnWidgetState();
}

class _PairingColumnWidgetState extends State<_PairingColumnWidget> {
  List<bool> selected = [];
  List<bool> paired = [];

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (var i = 0; i < widget.texts.length; i++) {
      selected.add(false);
      paired.add(false);
      list.add(Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: 200.0,
          height: 100.0,
          child: ElevatedButton(
            child: Text(widget.texts[i]),
            style: ElevatedButton.styleFrom(
              primary: selected[i]
                  ? const Color.fromRGBO(151, 144, 187, 1)
                  : paired[i]
                      ? Colors.green
                      : Colors.grey[400],
              onPrimary: Colors.black,
            ),
            onPressed: () => {
              setState(() {
                if (selected[i]) {
                  selected[i] = false;
                } else {
                  for (var k = 0; k < selected.length; k++) {
                    selected[k] = k == i;
                  }
                }
              })
            },
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
  List<bool> selectedLeft = [];
  List<bool> selectedRight = [];
  List<int> links = [];

  @override
  Widget build(BuildContext context) {
    selectedLeft = List.generate(widget.left.length, (index) => false);
    selectedRight = List.generate(widget.left.length, (index) => false);

    Widget leftCol = _PairingColumnWidget(texts: widget.left);
    Widget rightCol = _PairingColumnWidget(texts: widget.right);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [leftCol, rightCol],
    );
  }
}
