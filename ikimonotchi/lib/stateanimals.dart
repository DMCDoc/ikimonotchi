import 'package:flutter/material.dart';

class StateAnimals extends StatefulWidget {
  const StateAnimals({Key? key, required this.text1, required this.text2})
      : super(key: key);

  final Widget text1;
  final Widget text2;

  @override
  State<StateAnimals> createState() => _StateAnimalsState();
}

class _StateAnimalsState extends State<StateAnimals> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [widget.text1, widget.text2],
    );
  }
}
