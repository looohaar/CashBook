import 'package:cash_book/models/model_class.dart';
import 'package:cash_book/screens/home/screen_home.dart';
import 'package:cash_book/screens/login/screen_login.dart';
import 'package:cash_book/screens/onboarding/screen_onboarding1.dart';
import 'package:cash_book/screens/onboarding/screen_onboarding2.dart';
import 'package:cash_book/screens/splash/screen_splash.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

late Box<Category> categoryVariable;
late Box<Transactions> transactionsVariable;
late Box<Username> usernameVariable;

Future<void> main(List<String> args)async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(TransactionsAdapter());
  Hive.registerAdapter(UsernameAdapter());
  categoryVariable= await Hive.openBox<Category>('category');
  transactionsVariable= await Hive.openBox<Transactions>('transactions');
  usernameVariable= await Hive.openBox<Username>('username');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setPreferredOrientations([
       DeviceOrientation.portraitUp,
       DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 127, 5, 168),

        ) 
    
        
      ),
      debugShowCheckedModeBanner: false,
    
      home: SplashScreen(),
    );
  }
}
