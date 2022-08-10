import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({Key? key, required this.endTime, required this.url}) : super(key: key);
  final DateTime endTime;
  final String url;
  //print(url);
  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Duration duration = Duration();
  late final countDownDuration;
  late DateTime endTime;
  String url='a';
  var v;
  // static const countDownDuration = Duration(seconds: 10);
  bool isCountdown = true;
  Timer? timer;

  // Future _getBiddingDataFromFirestore() async {
  //   print('bye');
  //   await FirebaseFirestore.instance
  //       .collection("Product under auction")
  //       .doc(FirebaseAuth.instance.currentUser?.uid)
  //       .get()
  //       .then((snapshot) {
  //     if (snapshot.exists) {
  //       setState(() {
  //         print(('today'));
  //         url=snapshot.data()!["URL"];
          
  //         print(endTime);
  //       });
  //     }
  //   });
  // }
   void edit() async {
    await FirebaseFirestore.instance
                                .collection('Product under auction')
                                .where("URL", isEqualTo: [url])
                                .get()
                                .then((value) => (value.docs.forEach((element) {
                                      v = element.id;
                                    })));

                            await FirebaseFirestore.instance
                                .collection('Product under auction')
                                .doc(v)
                                .update({
                                  "FLAG": 'B',
                            });
                            setState(() {
                              
                            });
  }
  @override
  void initState() {
    super.initState();
    print('HELLO');
    // _getBiddingDataFromFirestore();
    endTime=widget.endTime;
    url=widget.url;
    print(endTime);
    // print(url);
    print('hi');
    var timeDifference = endTime.difference(DateTime.now()).inSeconds;
    countDownDuration = Duration(seconds: timeDifference);
    startTimer();
    reset();
  }


  void reset() {
    if (isCountdown) {
      setState(() {
        duration = countDownDuration;
      });
    } else {
      setState(() {
        duration = Duration();
      });
    }
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: buildTimer()),
    );
  }

  Widget buildTimer() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    final hours = twoDigits(duration.inHours.remainder(60));

    if (int.parse(seconds) <= 0 && int.parse(minutes) <=0 && int.parse(hours) <=0) {
        print(url);
        edit();
      return Text("Time is up", style: TextStyle(fontSize: 20));
    } else {
      return Text(
        "${hours}:${minutes}:${seconds}",
        style: TextStyle(fontSize: 20,
        ),
        
      );
    }
  }
}