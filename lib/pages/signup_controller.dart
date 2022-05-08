import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/user.dart';

class SignupController extends GetxController {
  late TextEditingController nameCon;
  late TextEditingController simplePasswordCon;
  late TextEditingController smokingNumCon;

  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    nameCon = TextEditingController();
    simplePasswordCon = TextEditingController();
    smokingNumCon = TextEditingController();
    formKey = GlobalKey();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    nameCon.dispose();
    simplePasswordCon.dispose();
    smokingNumCon.dispose();
  }

  // * 회원가입 메소드
  void validateAndSignup() {
    if (formKey.currentState!.validate()) {
      // 임시로 회원가입 데이터 저장
      Map<String, dynamic> signupData = {
        'name': nameCon.text,
        'password': simplePasswordCon.text,
        'smokingNum': smokingNumCon.text,
        'createdAt': DateTime.now()
      };

      // db에 업로드, 로컬에도 저장
      FirebaseFirestore.instance
          .collection('users')
          .add(signupData)
          .then((value) {
        // * User 객체로 데이터 저장
        Hive.box('loginData').put('key', User.fromJson(value.id, signupData));
        // 메인 페이지로 이동
        print(Hive.box('loginData').get('key'));
      });
    }
  }
}
