// This class is only used for testing purposes. TODO: Replace this routing page with the map-view on a later date.
import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
