import 'package:flutter/material.dart';
import 'package:game_mini/screen/play_game_screen.dart';
import 'package:game_mini/screen/home_screen.dart';
import 'package:game_mini/screen/result.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'English App',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.indigo,
          fontFamily: "Montserrat",
          buttonColor: Colors.lightBlue,
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              textTheme: ButtonTextTheme.primary)),
      home: HomeScreen(),

    );
  }
}
