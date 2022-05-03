import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:stop_smoking/main_controller.dart';
import 'package:stop_smoking/pages/signup_controller.dart';

import 'firebase_options.dart';
import 'main_screen.dart';
import 'pages/signup_page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('loginData');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white,fontFamily: 'Kangwon',fontSize: 22,fontWeight: FontWeight.bold)
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontFamily: 'Kangwon',fontSize: 20)
        ),
      ),
      initialRoute: Hive.box('loginData').get('key')==null?'/signup':'/main',
      getPages: [
        GetPage(
          name: '/signup',
          page: ()=>SignupPage(),
          binding: BindingsBuilder.put(()=>SignupController())
        ),
        GetPage(
            name: '/main',
            page: ()=>MainScreen(),
            binding: BindingsBuilder.put(()=>MainController())
        )
      ],
    );
  }
}