import 'package:flutter/material.dart';
import 'package:weather/screen/test1.dart';
import 'package:weather/screen/test2.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Home'),
            Text('Home'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TestOne()));
                }, child:Text('TestOne')),
                ElevatedButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TestTwo()));
                }, child:Text('TestTwo')),
              ]
            )
          ]
        )
      )
    );
  }
}
