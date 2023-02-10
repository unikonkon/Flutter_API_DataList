import 'package:flutter/material.dart';
import 'package:flutter_application/Home.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // backgroundColor: Color.fromARGB(255, 175, 185, 188),
              scaffoldBackgroundColor: Color.fromARGB(255, 50, 56, 61),
            ),
            home: Home(),
          );
        });
  }
}
