import 'package:flutter/material.dart';
import 'package:stop_smoking/pages/components/clock_controller.dart';
import 'package:get/get.dart';

class Clock extends GetView<ClockController> {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              '금연 시계',
              style: TextStyle(fontSize: 30),
            ),
            Text('${controller.getDays}일'),
            Text('${controller.getHours} 시간 째,'),
            Text('${controller.getMinutes} 분,'),
            Text('${controller.getSeconds} 초 경과')
          ],
        ),
      ),
    );
  }
}
