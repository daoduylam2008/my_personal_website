import 'package:flutter/material.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPage();
}

class _EducationPage extends State<EducationPage> {
  void onPressed() {
    Navigator.of(context).pushNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            children: [
              Text("My Home Page"),
              ElevatedButton(onPressed: onPressed, child: Text("Press me"))
            ],
    ));
  }
}
