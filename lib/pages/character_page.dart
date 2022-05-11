import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_smoking/main_controller.dart';
import 'package:stop_smoking/pages/components/character.dart';
import 'package:stop_smoking/pages/components/level_status.dart';

import 'components/clock.dart';
import 'components/clock_controller.dart';

class CharacterPage extends GetView<MainController> {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: Drawer(
          child: Column(children: [
            TextButton(
              child: const Text(
                '로그아웃',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {},
            )
          ]),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(
                    (Icons.menu),
                  ),
                  onPressed: () {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                ),
              ),
              Obx(
                () => Column(
                  children: [
                    Text(
                      '금연 ${ClockController.to.getDayPlus}일 차',
                      style: const TextStyle(
                          fontSize: 55, fontWeight: FontWeight.bold),
                    ),
                    const Text('잘 하고 있어요!'),
                  ],
                ),
              ),
              const Character(),
              const LevelStatus(),
              const Clock(),
            ],
          ),
        ),
        floatingActionButton: const FloatingActionButton(
          child: Text(
            '금연요정',
          ),
          onPressed: null,
        ),
      ),
    );
  }
}
