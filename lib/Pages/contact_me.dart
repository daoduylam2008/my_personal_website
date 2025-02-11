import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMePage extends StatefulWidget {
  const ContactMePage({super.key});

  @override
  State<ContactMePage> createState() => _ContactMePage();
}

class _ContactMePage extends State<ContactMePage> {
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
