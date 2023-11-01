import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather/screen/test1.dart';
import 'package:weather/screen/test2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _city = '';
  late TextEditingController _myCity = TextEditingController();

  Future<Map<String, dynamic>> getWeatherData() async {
    final apiKey = '3caf3f903761a3be710283be351b8d76';
    final apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$_city&units=metric&APPID=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

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
            Text('Hello World!'),
            TextField(
              onChanged: (value) {
                setState(() {
                  _city = value;
                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.opacity),
                labelText: 'Weather of ...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              controller: _myCity,
            ),
            Text('bye World!'),
            FutureBuilder<Map<String, dynamic>>(
                future: getWeatherData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('No data available'));
                  } else if (snapshot.hasData) {
                    return Center(
                        child: Text(
                            'Temp of $_city: ${snapshot.data!['main']['temp']}'));
                  } else {
                    return Text('test');
                  }
                }),
            ElevatedButton(
                onPressed: () {
                  getWeatherData();
                },
                child: Text('click')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestOne()));
                },
                child: Text('TestOne')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestTwo()));
                },
                child: Text('TestTwo')),

          ],
        ),
      ),
    );
  }
}
