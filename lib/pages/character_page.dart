import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:stop_smoking/pages/components/clock.dart';
import 'package:stop_smoking/pages/game_page.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Column(
              children: [
                FutureBuilder<DocumentSnapshot<Map<String,dynamic>>>(
                  future: FirebaseFirestore.instance.collection('users').doc(Hive.box('loginData').get('key')).get(),
                  builder: (context, snapshot){
                    if (snapshot.hasError){
                      return Text('Errors');
                    }
                    if (snapshot.connectionState==ConnectionState.waiting){
                      return CircularProgressIndicator(color: Colors.black,);
                    }
                    var data = snapshot.data!.data();
                    return Text('안녕하세요 ${data!['name']}님 오늘도 화이팅이에요!',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),);
                  },
                ),
                TextButton(
                  child: Text('눌러보실?'),
                  onPressed: (){
                    Get.to(()=>GamePage());
                  },
                ),
                Image.asset('assets/character.png'),
                FutureBuilder<DocumentSnapshot<Map<String,dynamic>>>(
                  future: FirebaseFirestore.instance.collection('users').doc(Hive.box('loginData').get('key')).get(),
                  builder: (context, snapshot){
                    if (snapshot.hasError){
                      return Text('Errors');
                    }
                    if (snapshot.connectionState==ConnectionState.waiting){
                      return CircularProgressIndicator(color: Colors.black,);
                    }
                    var data = snapshot.data!.data();
                    Timestamp timestamp = data!['createdAt'] as Timestamp;
                    DateTime dateTime = timestamp.toDate();
                    return Clock(dateTime: dateTime,smokingTimes: int.parse(data['smokingNum']),);
                  },
                ),
              ],
            ),
          ),
      ),
    );
  }
}
