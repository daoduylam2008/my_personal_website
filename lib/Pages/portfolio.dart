import 'package:flutter/material.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPage();
}

class _PortfolioPage extends State<PortfolioPage> {
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
