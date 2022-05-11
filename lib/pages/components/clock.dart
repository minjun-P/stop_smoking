import 'package:flutter/material.dart';
import 'package:stop_smoking/constants.dart';
import 'package:stop_smoking/pages/components/clock_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Clock extends GetView<ClockController> {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: mBorderRadius,
              boxShadow: const [mShadow],
              color: Colors.white),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '금연 정보',
                style: TextStyle(fontSize: 30),
              ),
              const Divider(
                thickness: 2,
              ),
              _buildStartRow(),
              _buildTimeRow(),
              _buildMoneyRow(controller.timeData.value.accumSeconds)
            ],
          ),
        ),
      ),
    );
  }

  _buildTimeRow() {
    return Row(
      children: [
        const Icon(Icons.lock_clock),
        const SizedBox(
          width: 10,
        ),
        Text(
            '${controller.getDays}일 ${controller.getHours}시간, ${controller.getMinutes}분 ${controller.getSeconds}초 지났습니다')
      ],
    );
  }

  _buildMoneyRow(int accumSeconds) {
    return Row(
      children: [
        const Icon(Icons.money),
        const SizedBox(
          width: 10,
        ),
        Text(
            '${(accumSeconds * controller.getSavedMoney()).toStringAsFixed(1)} 원을 아꼈습니다')
      ],
    );
  }

  _buildStartRow() {
    return Row(
      children: [
        const Icon(Icons.calendar_month),
        const SizedBox(
          width: 10,
        ),
        Text(DateFormat('yyyy-MM-dd hh:mm 에 시작!!')
            .format(controller.user.createdAt))
      ],
    );
  }
}
