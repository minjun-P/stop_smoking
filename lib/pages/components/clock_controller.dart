import 'dart:async';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:stop_smoking/models/time_data.dart';
import 'package:stop_smoking/models/user.dart';

class ClockController extends GetxController {
  static ClockController get to => Get.find<ClockController>();
  // * user 정보 가저오기
  User user = Hive.box('loginData').get('key');

  // * 반응형 변수 선언
  var timeData = TimeData.initilize().obs;
  // 주요 쓰이는 변수 getter
  String get getDays => timeData.value.days.toString();
  String get getHours => timeData.value.hours.toString();
  String get getMinutes => timeData.value.minutes.toString();
  String get getSeconds => timeData.value.seconds.toString();

  String get getDayPlus => timeData.value.dayPlus.toString();
  // timeData 만들기
  TimeData getTimeMap() {
    Duration diff =
        Duration(seconds: DateTime.now().difference(user.createdAt).inSeconds);
    int days = diff.inDays;
    int hours = diff.inHours % 24;
    int minutes = diff.inMinutes % 60;
    int seconds = diff.inSeconds % 60;
    int accumSeconds = diff.inSeconds;

    // * d + day 처리하기
    int dayPlus = putDayPlus(user.createdAt);

    return TimeData(
        days: days,
        hours: hours,
        minutes: minutes,
        seconds: seconds,
        accumSeconds: accumSeconds,
        dayPlus: dayPlus);
  }

  int putDayPlus(DateTime userDate) {
    DateTime tempDate =
        DateTime(userDate.year, userDate.month, userDate.day, 0, 0);

    int dayPlus = DateTime.now().difference(tempDate).inDays + 1;
    return dayPlus;
  }

  double getSavedMoney() {
    int smokingNum = int.parse(user.smokingNum);
    int dailyCost = smokingNum * 225;
    double costPerSecond = dailyCost / 86400;
    return costPerSecond;
  }

  @override
  void onInit() {
    // * 1초마다 now  반응형 변수 업데이트
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timeData.value = getTimeMap();
    });
    super.onInit();
  }
}
