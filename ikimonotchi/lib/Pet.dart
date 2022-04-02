import 'package:flutter/material.dart';
import 'timer_ticker.dart';
import 'tetssss.dart';

class Pet extends StatefulWidget {
  Pet({
    Key? key,
  }) : super(key: key);

  @override
  State<Pet> createState() => _PetState();
}

int hunger = 4;
int boredom = 5;
final bon = Timer_Ticker();

class _PetState extends State<Pet> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void hunger_decrement() {
    {
      hunger--;
      DateTime.now();
      print(DateTime.now());
    }
    ;
  }

  void blabla() {}
  void boderdom_decrement() {
    setState(() {
      boredom--;
    });
  }
}
