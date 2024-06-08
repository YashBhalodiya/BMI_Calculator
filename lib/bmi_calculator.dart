import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  var weightController = TextEditingController();

  var heightController = TextEditingController();

  var userNameController = TextEditingController();

  var result = "";

  // ignore: prefer_typing_uninitialized_variables
  var bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(children: [
              const Text(
                "BMI Calculator",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    label: Text("Enter Your Name"),
                    prefixIcon: Icon(Icons.person_2_sharp)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text("Enter Weight (Kg)"),
                    prefixIcon: Icon(Icons.line_weight_rounded)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text("Enter Height (Meter)"),
                    prefixIcon: Icon(Icons.height)),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    var weight = weightController.text.toString();
                    var height = heightController.text.toString();
                    var userName = userNameController.text.toString();

                    if (weight != "" && height != "") {
                      var intWeight = double.parse(weight);
                      var intHeight = double.parse(height);

                      var bmi = intWeight / (intHeight * intHeight);

                      var bmiMSG = "";

                      if (bmi < 18) {
                        bmiMSG = "You're UnderWeight";
                        bgColor = Colors.red.shade200;
                      } else if (bmi > 25) {
                        bmiMSG = "You're OverWeight";
                        bgColor = Colors.orange.shade200;
                      } else {
                        bmiMSG = "You're Healthy";
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                        result =
                            "Hello! $userName, \nYour BMI(Body Mass Index) is: ${bmi.toStringAsFixed(3)} \n\n                 $bmiMSG";
                      });
                    } else {
                      setState(() {
                        result = "Please fill the required fields";
                      });
                    }
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              const SizedBox(
                height: 15,
              ),
              Text(
                result,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  // height: 4,
                ),
              ),
            ]),
          ),
        ));
  }
}
