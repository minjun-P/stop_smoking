import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:stop_smoking/main_controller.dart';
import 'package:stop_smoking/models/user.dart';
import 'package:stop_smoking/pages/components/clock_controller.dart';
import 'package:stop_smoking/pages/signup_controller.dart';

import 'firebase_options.dart';
import 'main_screen.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';

void main() async {
  // 파이어베이스 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // 하이브 초기화
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox('loginData');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // * 기본 테마 설정
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'Kangwon',
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        textTheme: const TextTheme(
            bodyText2: TextStyle(fontFamily: 'Kangwon', fontSize: 20)),
      ),
      // * 데이터 키를 가져와 로그인 여부 확인
      initialRoute:
          Hive.box('loginData').get('key') == null ? '/signup' : '/main',
      getPages: [
        GetPage(
            name: '/signup',
            page: () => const SignupPage(),
            binding: BindingsBuilder.put(() => SignupController())),
        GetPage(name: '/main', page: () => const MainScreen(), bindings: [
          BindingsBuilder.put(() => MainController()),
          BindingsBuilder.put(() => ClockController())
        ]),
        GetPage(name: '/login', page: () => const LoginPage())
      ],
    );
  }
}
