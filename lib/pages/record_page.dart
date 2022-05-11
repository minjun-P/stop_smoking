import 'package:flutter/material.dart';
import 'package:stop_smoking/constants.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('오늘의 금연일지'),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  boxShadow: const [mShadow],
                  borderRadius: mBorderRadius,
                  color: Colors.white),
              child: const Text(
                  '금연 일지 작성은 금연에 큰 도움을 줄 수 있습니다. 다른 사람들과 금연일지를 공유하며 금연에 성공해봐요!'),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 40,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 0.2,
                              blurRadius: 4,
                              offset: Offset(1, 1))
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text('아 담배 말린다'),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text('작성',
              style: TextStyle(fontFamily: 'Kangwon', fontSize: 20)),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    title: Text(
                      '오늘의 금연일지',
                      style: TextStyle(fontFamily: 'Kangwon'),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
