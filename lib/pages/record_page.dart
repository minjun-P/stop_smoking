import 'package:flutter/material.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('오늘의 금연일지',style: TextStyle(fontSize: 30),),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index){
                    return Container(
                      height: 40,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0.2,
                            blurRadius: 4,
                            offset: Offset(1,1)
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Text('아 담배 말린다'),
                    );
                  },
                  itemCount: 10,

              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('작성',style: TextStyle(fontFamily: 'Kangwon',fontSize: 20)),
          onPressed: (){
            showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text('오늘의 금연일지',style: TextStyle(fontFamily: 'Kangwon'),),
                  );
                }
            );
          },
        ),
      ),
    );
  }
}
