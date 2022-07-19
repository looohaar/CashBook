import 'package:cash_book/screens/home/screen_home.dart';
import 'package:cash_book/screens/onboarding/screen_onboarding1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

var finalName;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValidationData();



  }

         

        Future getValidationData() async{
          final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
          var userName= sharedPreferences.getString('name');
           finalName=userName;
        } 
  @override
  Widget build(BuildContext context) {
     double mediaqueryHeight= MediaQuery.of(context).size.height;
     double mediaqueryWidth= MediaQuery.of(context).size.width;

 whenComplete(context);


    return Scaffold(
        body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 101, 23, 127)),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          SizedBox(
            width: mediaqueryWidth*0.82,
            height: mediaqueryHeight*0.25,
            child: Image(image: AssetImage('assets/images/logo3.png')),
          ),
          SizedBox(height: 10),
          Text(
            'CashBook',
            style: TextStyle(
                fontFamily: 'Ubuntu-Bold',
                fontSize: mediaqueryWidth*0.145,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Your Perfect Accounting Partner',
            style: TextStyle(
                fontSize: mediaqueryWidth*0.06,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 199, 119, 223)),
                textAlign: TextAlign.center,
          ),
          SizedBox(height: mediaqueryHeight*0.03),
          SpinKitThreeBounce(
            color: Colors.white,
            size: mediaqueryHeight*0.05,
          ),
        ],
      ),
    ));
  }
}








  whenComplete(context) async {
  Future.delayed(Duration(milliseconds: 2500)).then((value) =>
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  finalName == null? Onboarding1() : Home())));


                


}