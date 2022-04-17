import 'package:flutter/material.dart';

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
    links = List.generate(widget.left.length, (index) => 0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [_makeColumn(widget.left), _makeColumn(widget.right)],
    );
  }

  Column _makeColumn(col) {
    List<Widget> list = [];
    for (var i = 0; i < col.length; i++) {
      list.add(Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: 200.0,
          height: 100.0,
          child: ElevatedButton(
            child: Text(col[i]),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey[400],
              onPrimary: Colors.black,
            ),
            onPressed: null,
          ),
        ),
      ));
    }
    return Column(children: list);
  }
}
