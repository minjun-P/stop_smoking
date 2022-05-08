import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/user.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginKey = GlobalKey();
  Future validateAndLogin(String name, String password) async {
    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: name)
        .where('password', isEqualTo: password)
        .get();
    if (query.docs.isEmpty) {
      Get.defaultDialog(title: '해당하는 계정이 존재하지 않습니다');
    } else {
      var loginData = query.docs[0];
      Hive.box('loginData')
          .put('key', User.fromJson(loginData.id, loginData.data()));
      Get.offAllNamed('/main');
    }
  }

  late TextEditingController nameCon;
  late TextEditingController passwordCon;

  @override
  void onInit() {
    nameCon = TextEditingController();
    passwordCon = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameCon.dispose();
    passwordCon.dispose();
    super.onClose();
  }
}
