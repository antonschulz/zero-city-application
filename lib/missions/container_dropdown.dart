import 'package:flutter/material.dart';

// Button widget which works as answers to a given Q for missions
class Container_dropdown extends StatefulWidget {
  Container_dropdown(this.picture, this.alternatives, {Key? key})
      : super(key: key);
  late Text picture;
  late List<String> alternatives;
  var dropdownValue = '1';

  @override
  State<Container_dropdown> createState() => Container_dropdownState();
}

class Container_dropdownState extends State<Container_dropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 120,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(child: widget.picture),
            Expanded(
                child: DropdownButton<String>(
              value: widget.dropdownValue,
              icon: const Icon(Icons.arrow_downward, color: Colors.black),
              elevation: 16,
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 3,
                color: Colors.black,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  widget.dropdownValue = newValue!;
                });
              },
              items: <String>['1', '2']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: 20)),
                );
              }).toList(),
            )),
          ],
        ));
  }
}
