import 'package:cash_book/main.dart';
import 'package:cash_book/models/model_class.dart';
import 'package:cash_book/screens/home/screen_home.dart';
import 'package:cash_book/screens/onboarding/screen_onboarding1.dart';
import 'package:cash_book/screens/onboarding/screen_onboarding2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

// var finalName;
//  ValueNotifier<String?> finalName= ValueNotifier(null);
  List<Username> userNameList= usernameVariable.values.toList();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  // @override
  // void initState() {
  //  if (finalName.value!=null) {
      
  //     finalName.value= sharedprefVarible.getString('name');
     
  //  }
  //   super.initState();
  //   // getValidationData();
    
     

  // }

         

        // Future getValidationData() async{
        //   final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
        //    var userName= sharedPreferences.getString('name');
        //   //  sharedPreferences.reload();
        //    return userName==null||userName.isEmpty
        //    ? finalName.value= ''

        //    :finalName.value=userName
        //    ;
        // } 

        @override
        void initState(){
          if (userNameList.isEmpty|| userNameList.length==0) {
            
          }
          
           super.initState();
        }
  @override
  Widget build(BuildContext context) {
  
     double mediaqueryHeight= MediaQuery.of(context).size.height;
     double mediaqueryWidth= MediaQuery.of(context).size.width;
     
    SizedBox hdivider1= SizedBox(height: mediaqueryHeight*0.0155,);
     SizedBox hdivider2= SizedBox(height: mediaqueryHeight*0.02325,);
    
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
         SizedBox(height: mediaqueryHeight*0.0155),
          Text(
            'CashBook',
            style: TextStyle(
                fontFamily: 'Ubuntu-Bold',
                fontSize: mediaqueryWidth*0.145,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          
          SizedBox(height: mediaqueryHeight*0.0155),
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
                 userNameList.isEmpty? Onboarding1()
                  :userNameList.length==0?Onboarding1() 
                   :Home())));


                


}