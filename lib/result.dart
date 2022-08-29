import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key, required this.age, required this.isMale, required this.BMI})
      : super(key: key);

  final int age;
  final bool isMale;
  final double BMI;

  String get resultPhrase {
    String resultPhrase = '';
    if (BMI <= 18.5) {
      resultPhrase = "You're underweight! :(";
    }
    if (BMI > 18.5 && BMI <= 25) {
      resultPhrase = "Perfectly healthy!";
    }
    if (BMI > 25 && BMI <= 30) {
      resultPhrase = "You're slightly overweight! :(";
    }
    if (BMI > 30) {
      resultPhrase = "You're obese, you should try a diet regime!";
    }
    return resultPhrase;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Gender: ${isMale ? 'Male' : 'Female'}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Age: $age',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Result: ${BMI.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  resultPhrase,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ]),
        ),
      ),
    );
  }
}
