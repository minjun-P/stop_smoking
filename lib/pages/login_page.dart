import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_smoking/pages/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: _buildLoginForm(),
    ));
  }

  Widget _buildLoginForm() {
    return Form(
      key: controller.loginKey,
      child: Center(
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            const Text(
              '로그인',
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: Get.width * 0.5,
              child: TextFormField(
                  controller: controller.nameCon,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: '이름'),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return '값을 입력해주세요';
                    } else {
                      return null;
                    }
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: Get.width * 0.5,
              child: TextFormField(
                controller: controller.passwordCon,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: '전화번호 뒷 4자리'),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return '값을 입력해주세요';
                  }
                  if (int.tryParse(text) == null) {
                    return '숫자를 입력해주세요';
                  }
                  if (text.length != 4) {
                    return '4자리를 입력해주세요';
                  }
                  return null;
                },
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  if (controller.loginKey.currentState!.validate()) {
                    controller.getLoginDialog();
                  }
                },
                child: const Text('계정확인')),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
