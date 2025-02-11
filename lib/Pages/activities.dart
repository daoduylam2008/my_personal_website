import 'package:flutter/material.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPage();
}

class _ActivitiesPage extends State<ActivitiesPage> {
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
