import 'package:cash_book/screens/home/screen_home.dart';
import 'package:cash_book/screens/onboarding/screen_onboarding1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

var checkingname;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

favourite obj = favourite();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVaildationData();



  }

  Future getVaildationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedName = sharedPreferences.getString('name');
    checkingname = obtainedName;
  }

  @override
  Widget build(BuildContext context) {

obj.whenComplete(context);


    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: Color.fromARGB(255, 101, 23, 127)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image(image: AssetImage('assets/images/logo3.png')),
          ),
          SizedBox(height: 10),
          Text(
            'CashBook',
            style: TextStyle(
                fontFamily: 'Ubuntu-Bold',
                fontSize: 55,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Your Perfect Accounting Partner',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 199, 119, 223)),
          ),
          SizedBox(height: 10),
          SpinKitThreeBounce(
            color: Colors.white,
            size: 30.0,
          ),
        ],
      ),
    ));
  }
}







class favourite  {
  whenComplete(context) async {
  Future.delayed(Duration(milliseconds: 2500)).then((value) =>
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  checkingname == null ? Onboarding1() : Home())));


                  update();
}

}