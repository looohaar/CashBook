import 'package:cash_book/screens/home/screen_home.dart';
import 'package:cash_book/screens/login/screen_login.dart';
import 'package:cash_book/screens/onboarding/screen_onboarding1.dart';
import 'package:cash_book/screens/onboarding/screen_onboarding2.dart';
import 'package:cash_book/screens/splash/screen_splash.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 127, 5, 168),

        ) 
    
        
      ),
      debugShowCheckedModeBanner: false,
    
      home: Card(),
    );
  }
}
