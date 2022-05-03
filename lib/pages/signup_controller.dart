import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SignupController extends GetxController {
  late TextEditingController nameCon;
  late TextEditingController simplePasswordCon;
  late TextEditingController smokingNumCon;

  late GlobalKey<FormState> formKey;

  late String? loginData;

  @override
  void onInit() {
    // TODO: implement onInit
    nameCon = TextEditingController();
    simplePasswordCon = TextEditingController();
    smokingNumCon = TextEditingController();
    formKey = GlobalKey();
    loginData = Hive.box('loginData').get('name');
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameCon.dispose();
    simplePasswordCon.dispose();
    smokingNumCon.dispose();
  }
}