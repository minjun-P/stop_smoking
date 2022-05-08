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
              ),
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
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  controller.validateAndLogin(
                      controller.nameCon.text, controller.passwordCon.text);
                },
                child: const Text('로그인')),
            const Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
