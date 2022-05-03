import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_smoking/pages/game_page.dart';

import 'main_controller.dart';
import 'pages/character_page.dart';
import 'pages/record_page.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Scaffold(
        body: IndexedStack(
          index: controller.bottomBarIndex.value,
          children: [
            CharacterPage(),
            RecordPage(),

          ],
        ),
        bottomNavigationBar:BottomNavigationBar(
          backgroundColor: Colors.blueGrey.shade300,
            items: [
              BottomNavigationBarItem(icon: Text('1'),label: ''),
              BottomNavigationBarItem(icon: Text('2'),label: ''),
            ],
            currentIndex: controller.bottomBarIndex.value,
            onTap: (index){
              controller.bottomBarIndex(index);
            },
          ),
      ),
    );
  }
}
