import 'package:flutter/material.dart';

class TestTwo extends StatelessWidget {
  const TestTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Two'),
      ),
        body: Center(
          child: Text('Test Two'),
        )
    );
  }
}
