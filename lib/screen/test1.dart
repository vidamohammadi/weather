import 'package:flutter/material.dart';

class TestOne extends StatelessWidget {
  const TestOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test One'),
      ),
      body: Center(
        child: Text('Test One'),
      )
    );
  }
}
