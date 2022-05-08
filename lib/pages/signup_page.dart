import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:stop_smoking/pages/signup_controller.dart';

import '../models/user.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  '*이름과 휴대폰 뒷 4자리는 이후 로그인에 사용됩니다.',
                  style: TextStyle(fontSize: 15, color: Colors.red.shade300),
                )),
            _buildLoginContainer(),
            _buildSignupContainer(
                '담배는 하루에 몇 개비 피세요?', 3, controller.smokingNumCon),
            TextButton(
              child: const Text('제출'),
              onPressed: () {
                // 회원가입 메소드 - 컨트롤러에 정의
                controller.validateAndSignup();
              },
            ),
            TextButton(
              child: const Text('로그인'),
              onPressed: () {
                Get.toNamed('/login');
              },
            ),
            Builder(
              builder: (context) {
                User? user = Hive.box('loginData').get('key');
                if (user == null) {
                  return const Text('null');
                }
                return Column(
                  children: [
                    Text(user.id),
                    Text(user.name),
                    Text(user.smokingNum)
                  ],
                );
              },
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildLoginContainer() {
    return Column(
      children: [
        _buildSignupContainer('이름', 1, controller.nameCon),
        _buildSignupContainer('휴대폰 뒷 4자리', 2, controller.simplePasswordCon)
      ],
    );
  }

  Widget _buildSignupContainer(
      String title, int index, TextEditingController con) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Q.' + title),
          TextFormField(
            controller: con,
            validator: (String? value) {
              if (value!.isEmpty) {
                return '값이 입력되지 않았습니다.';
              }
              if (index == 2) {
                if (value.length != 4) {
                  return '4자의 숫자로 작성해주세요';
                }
              }
              if (index == 3) {
                if (int.tryParse(value) == null) {
                  return '올바른 숫자값이 아닙니다.';
                }
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
