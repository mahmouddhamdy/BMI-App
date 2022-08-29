import 'package:flutter/material.dart';
import 'package:flutter_application_1/result.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = false;
  int age = 21, weight = 60;
  double height = 172;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Body Mass Index",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    genderSelection(
                      context,
                      true,
                      "Male",
                      const Icon(Icons.male, size: 90),
                    ),
                    const SizedBox(width: 40),
                    genderSelection(
                      context,
                      false,
                      "Female",
                      const Icon(Icons.female, size: 90),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Height",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            " CM",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                      Slider(
                        value: height,
                        onChanged: (newValue) => {
                          setState(
                            () => {height = newValue},
                          )
                        },
                        min: 90,
                        max: 220,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    weightAgefn(context, "Weight", weight),
                    const SizedBox(width: 40),
                    weightAgefn(context, "Age", age),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              width: (MediaQuery.of(context).size.width) * 0.9,
              height: (MediaQuery.of(context).size.height) / 16,
              child: TextButton(
                onPressed: () {
                  double bmi = weight / (pow(height / 100, 2));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Result(BMI: bmi, isMale: isMale, age: age),
                    ),
                  );
                },
                child: Text(
                  "Calculate BMI",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded genderSelection(
      BuildContext context, bool male, String title, Icon icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () => {
          setState(() {
            isMale = male;
          })
        },
        child: Container(
          height: 170.0,
          decoration: BoxDecoration(
            color: isMale == true
                ? const Color.fromARGB(255, 65, 79, 87)
                : Colors.blueGrey,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded weightAgefn(BuildContext context, String title, int value) {
    return Expanded(
      child: GestureDetector(
        onTap: () => {
          setState(() {
            // isMale = male;
          })
        },
        child: Container(
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                '$value',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        title == 'Age' ? age-- : weight--;
                      });
                    },
                    mini: true,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        title == 'Age' ? age++ : weight++;
                      });
                    },
                    mini: true,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(Icons.add),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
