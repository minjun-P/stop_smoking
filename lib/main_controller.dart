import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'models/user.dart';

class MainController extends GetxController {
  var bottomBarIndex = 0.obs;
  late User user;
  @override
  void onInit() {
    user = Hive.box('loginData').get('key');
    super.onInit();
  }
}
