import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:stop_smoking/main_controller.dart';
import 'package:stop_smoking/pages/game_page.dart';

import 'components/clock.dart';
import 'components/clock_controller.dart';

class CharacterPage extends GetView<MainController> {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 200,
                elevation: 20,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                '금연 ${ClockController.to.getDayPlus}일 차',
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              child: const Text('눌러보실?'),
                              onPressed: () {
                                Get.to(() => const GamePage());
                              },
                            ),
                            TextButton(
                              child: const Text('로그아웃'),
                              onPressed: () {
                                Get.offAllNamed('/signup');
                                Hive.box('loginData').delete('key');
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('오늘 기분은 어떠세요?')
                      ],
                    ),
                  ),
                )),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/character.png'),
                  const Clock(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
