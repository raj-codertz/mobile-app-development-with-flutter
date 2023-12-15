import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  late TextEditingController _controller;
  String result = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void calculateArea() {
    double radius = double.tryParse(_controller.text) ?? 0;
    double area = math.pi * math.pow(radius, 2);

    setState(() {
      result = 'The area of the circle is $area';
    });

    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(result),
          shape: RoundedRectangleBorder(
              //to set border radius to button
              borderRadius: BorderRadius.circular(0)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text("Area calculator", style: TextStyle(color: Colors.white)),
            Spacer(),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter radius (in meters)',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (String value) {},
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity, // Make the button take the full width
              child: ElevatedButton(
                onPressed: () {
                  calculateArea();
                },
                child: const Text('CALCULATE',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  elevation: 12.0,
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(0)),
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
