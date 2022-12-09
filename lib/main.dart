
import 'package:flutter/material.dart';
import 'package:tp1/exo1/profile_home_page.dart';
import 'package:tp1/exo2/quizz_page.dart';
import 'package:tp1/main/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => MainPage(),
        '/exo1': (context) => ProfileHomePage(),
        '/exo2': (context) => QuizzPage(title: "Questions/Réponses",),
      },
      initialRoute: '/',
      // home: const QuizzPage(title: "Questions/Réponses"),
    );
  }
}



