import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String result = ''; // Create a variable to hold the result

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/bmi_background.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 80,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20), // Adjusted padding values
                  child:  Text(
                    'YOUR BMI is   \n $result', // Use the result variable here
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 170,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 50.0, left: 30, right: 30, bottom: 30),
                  child: Text(
                    'Please enter your weight and height to calculate your BMI', // Use the result variable here
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: 470, // Set a proper height value
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
                  child: MyFormWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFormWidget extends StatefulWidget {
  const MyFormWidget({Key? key}) : super(key: key);

  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String result = '';

  // Move result variable here

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: weightController,
          decoration: InputDecoration(labelText: 'Weight(kg)'),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
          ],
        ),
        const SizedBox(height: 16.0),
        TextField(
          controller: heightController,
          decoration: InputDecoration(labelText: 'Height(m)'),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
          ],
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          width: 570.0,
          child: ElevatedButton(
            onPressed: () {
              calculateBMI();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              backgroundColor: Colors.redAccent,
            ),
            child: const Text('CALCULATE', style: TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 16.0),
        const Padding(
          padding: EdgeInsets.only(top: 110.0, left: 0, right: 0),
          child: Text(
            'Body mass index, or BMI is used to determine whether you are in a healthy range for your height',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            "This calculator shouldn't be used by pregnant women or children",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
      ],
    );
  }

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      double bmi = weight / (height * height);
      setState(() {
        result = 'Your BMI is ${bmi.toStringAsFixed(1)} - ${getBMIStatus(bmi)}';
      });
    } else {
      setState(() {
        result = 'Invalid input. Please enter valid weight and height.';
      });
    }
  }

  String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 'Healthy weight';
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 'Overweight';
    } else if (bmi >= 30 && bmi <= 34.9) {
      return 'Obese';
    } else if (bmi >= 35 && bmi <= 39.9) {
      return 'Severely obese';
    } else {
      return 'Morbidly obese';
    }
  }
}
