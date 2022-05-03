import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('게임 페이지'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            _buildGameContainer('대신 담배피기'),
            _buildGameContainer('담배 대신 명상'),
            _buildGameContainer('금연 꿀팁 백과'),
            SizedBox(height: 30,),
            Align(
              alignment: Alignment.center,
              child: _buildVibratingContainer(),
            )


          ],
        ),
      ),
    );
  }

  _buildGameContainer(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,style: TextStyle(fontSize: 28,),),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black,width: 2)),
      ),
    );
  }
  _buildVibratingContainer() {
    return Align(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                _buildVibratingButton(0),
                _buildVibratingButton(1)
              ],
            ),
            Row(
              children: [
                _buildVibratingButton(0),
                _buildVibratingButton(1)
              ],
            )
          ],
        ),
      ),
    );
  }
  _buildVibratingButton(int index) {
    return GestureDetector(
      onTap: (){
        Vibrate.vibrate();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black
        ),
        margin: const EdgeInsets.all(5),
        width: 110,
        height: 110,
        child: Text(index%2==0?'똑':'딱',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
        alignment: Alignment.center,
      ),
    );
  }
}
