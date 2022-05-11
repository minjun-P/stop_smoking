import 'package:flutter/material.dart';
import 'package:stop_smoking/constants.dart';

class LevelStatus extends StatelessWidget {
  const LevelStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              '지금 당신은?',
              style: TextStyle(fontSize: 30),
            ),
            const Divider(
              thickness: 2,
            ),
            Container(
              height: 10,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
