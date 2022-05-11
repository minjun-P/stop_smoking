import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/user.dart';

class LoginController extends GetxController {
  // 로그인 폼 컨트롤
  GlobalKey<FormState> loginKey = GlobalKey();
  // 로그인 - dialog 활용
  void getLoginDialog() {
    Get.dialog(AlertDialog(
      content: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('users')
            .where('name', isEqualTo: nameCon.text)
            .where('password', isEqualTo: passwordCon.text)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Text('해당하는 계정이 존재하지 않습니다');
          } else {
            QueryDocumentSnapshot<Map<String, dynamic>> res =
                snapshot.data!.docs[0];
            Map<String, dynamic> data = res.data();
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '안녕하세요 ${data['name']}님',
                  style: const TextStyle(fontFamily: 'Kangwon', fontSize: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  child: const Text('로그인'),
                  onPressed: () {
                    Hive.box('loginData')
                        .put('key', User.fromJson(res.id, data));
                    Get.offAllNamed('/main');
                  },
                )
              ],
            );
          }
        },
      ),
    ));
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
