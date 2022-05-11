import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_controller.dart';
import 'pages/character_page.dart';
import 'pages/record_page.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.bottomBarIndex.value,
          children: const [
            CharacterPage(),
            RecordPage(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(0, 0))
          ]),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 100,
            items: const [
              BottomNavigationBarItem(icon: Text('1'), label: ''),
              BottomNavigationBarItem(icon: Text('2'), label: ''),
            ],
            currentIndex: controller.bottomBarIndex.value,
            onTap: (index) {
              controller.bottomBarIndex(index);
            },
          ),
        ),
      ),
    );
  }
}
