import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:stop_smoking/main_screen.dart';
import 'package:stop_smoking/pages/game_page.dart';
import 'package:stop_smoking/pages/signup_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
              SizedBox(height: 20,),
              Align(alignment: Alignment.center,child: Text('*이름과 휴대폰 뒷 4자리는 이후 로그인에 사용됩니다.',style: TextStyle(fontSize: 15,color: Colors.red.shade300),)),
              _buildLoginContainer(),
              _buildSignupContainer('담배는 하루에 몇 개비 피세요?',3,controller.smokingNumCon),
              TextButton(
                child: Text('제출'),
                onPressed: (){
                  if (controller.formKey.currentState!.validate()){
                    print(controller.nameCon.text);
                    FirebaseFirestore.instance.collection('users').add({
                      'name':controller.nameCon.text,
                      'password':controller.simplePasswordCon.text,
                      'smokingNum':controller.smokingNumCon.text,
                      'createdAt':DateTime.now()
                    }).then((value) {
                      Hive.box('loginData').put('key', value.id);
                      Get.offNamed('/main');
                    });

                  }
                },
              ),

              GestureDetector(
                onTap: (){
                  Get.to(()=>GamePage());
                },
                  child: Text('이동')
              ),
              GestureDetector(
                  onTap: (){
                    print(Hive.box('loginData').get('key'));
                  },
                  child: Text('get')
              ),
              GestureDetector(
                  onTap: (){
                    Hive.box('loginData').delete('key');
                  },
                  child: Text('delete')
              ),
            ],
          ),
        ),
      )
    );
  }
  Widget _buildLoginContainer() {
    return Container(

      child: Column(
        children: [
          _buildSignupContainer('이름',1,controller.nameCon),
          _buildSignupContainer('휴대폰 뒷 4자리',2,controller.simplePasswordCon)
        ],
      ),
    );
  }

  Widget _buildSignupContainer(String title, int index,TextEditingController con){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Q.'+title),
          TextFormField(
            controller: con,
            validator: (String? value){
              if (value!.isEmpty){
                return '값이 입력되지 않았습니다.';
              }
              if (index==2){
                if(value.length!=4){
                  return '4자의 숫자로 작성해주세요';
                }
              }
              if (index==3){
                if(int.tryParse(value)==null){
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
