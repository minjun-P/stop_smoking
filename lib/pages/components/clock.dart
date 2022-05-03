import 'dart:async';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  final DateTime dateTime;
  final int smokingTimes;
  const Clock({
    Key? key,
    required this.dateTime,
    required this.smokingTimes
  }) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {

  DateTime _now = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _now = DateTime.now(); // or BinaryTime see next step
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int days = Duration(seconds: _now.difference(widget.dateTime).inSeconds).inDays;
    int hours = Duration(seconds: _now.difference(widget.dateTime).inSeconds).inHours%24;
    int minutes = Duration(seconds: _now.difference(widget.dateTime).inSeconds).inMinutes%60;
    int seconds = Duration(seconds: _now.difference(widget.dateTime).inSeconds).inSeconds%60;
    int cumulatedSeconds = Duration(seconds: _now.difference(widget.dateTime).inSeconds).inSeconds;
    double savingMoney = widget.smokingTimes*225/86400*cumulatedSeconds;
    TextStyle textStyle = const TextStyle(color: Colors.white);

    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('금연 $days일 째',style: textStyle,),
          Text('$days일 $hours시간 $minutes분 $seconds초',style: textStyle,),
          Text('아낀 돈 ${savingMoney.toStringAsFixed(3)}원',style: textStyle,)
        ],
      ),
    );
  }
}
