import 'package:flutter/material.dart';
import 'package:stop_smoking/constants.dart';

class Character extends StatelessWidget {
  const Character({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [mShadow]),
      child: Column(
        children: [
          Image.asset('assets/character.png'),
          Row(
            children: [
              const Text('레벨 2'),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15)),
                  height: 15,
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.7,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
