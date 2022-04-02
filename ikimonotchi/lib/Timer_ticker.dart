import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ikimonotchi/stateanimals.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences prefs;

class Timer_Ticker extends StatefulWidget {
  Timer_Ticker({Key? key}) : super(key: key);

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  State<Timer_Ticker> createState() => _Timer_TickerState();
}

class _Timer_TickerState extends State<Timer_Ticker> {
  final Duration needfeed = const Duration(seconds: 20);
  late DateTime _lastfeed = DateTime.now();
  bool eclosion = true;
  late String _pressDuration;
  late Duration birth = const Duration(seconds: 5);

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    const keyfeed = "lastFeed";
    final lastfeed = _lastfeed;
    final now = DateTime.now();
    final valuefeed = now.difference(lastfeed);
    prefs.setInt(keyfeed, valuefeed.inSeconds);

    return valuefeed;
  }

  remove() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove("keyFeed");
    print("succes");
  }

  void saving() async {
    final times = await _save();
    print(times);
  }

  Future<Duration?> birth1() async {
    await Future.delayed(birth);
    return birth;
  }

  Future<Duration> duration1() async {
    await Future.delayed(needfeed);

    return needfeed;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: const Text("feed me"),
          onPressed: () async {
            print("j'ai mangé");

            saving();
            setState(() => eclosion = !eclosion);
          },
        ),
        FutureBuilder(
          future: duration1(),
          builder: (context, snpashot) {
            if (snpashot.hasData) {
              return const Text("small hungry");
            }

            return const Text("good");
          },
        ),
        FutureBuilder(
            future: birth1(),
            builder: (context, snpashot) {
              if (snpashot.hasData) {
                return const StateAnimals(
                  text1: Text("birth"),
                  text2: Text("hungry"),
                );
              }
              if (eclosion = eclosion) {
                return const StateAnimals(
                    text1: Text("nothing"), text2: Text("nada"));
              }
              if (eclosion = !eclosion) {
                return const StateAnimals(
                    text1: Text("feeds"), text2: Text("happy"));
              }

              return const Text("wait");
            })
      ],
    );
  }

  @override
  void _updateTimer() {
    final duration = DateTime.now().difference(_lastfeed);
    final newDuration = _formatDuration(duration);
    setState(() {
      _pressDuration = newDuration;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
