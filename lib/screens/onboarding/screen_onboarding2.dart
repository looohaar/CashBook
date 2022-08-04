

import 'package:cash_book/main.dart';
import 'package:cash_book/screens/login/screen_login.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Onboarding2 extends StatelessWidget {
  const Onboarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double mediaqueryHeight= MediaQuery.of(context).size.height;
    double mediaqueryWidth= MediaQuery.of(context).size.width;
    
    SizedBox hdivider1= SizedBox(height: mediaqueryHeight*0.0155,);
     SizedBox hdivider2= SizedBox(height: mediaqueryHeight*0.02325,);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
             color: Color.fromRGBO(255, 255, 255, 1)
            // color: Color.fromRGBO(255, 255, 255, 1)
           
          ),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height:mediaqueryHeight*0.28,
                      width: double.infinity,
                      child: Image(image: AssetImage('assets/images/onboarding2.jpg')),
                    ),
                    hdivider2,
                    Text('Build Your Wealth',
                    style:GoogleFonts.signika(
                      color: headingColor,
                      // fontSize: mediaqueryHeight*0.039,
                        fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ) ,
                     textAlign: TextAlign.center,
                    ),
                    hdivider2,
                    Text('CashBook will be the backbone of your wealth generation game.This application will give you all the suggestions for accumulating wealth and spending money.',
                    style: GoogleFonts.signika(
                      fontSize: mediaqueryHeight*0.025,
                      color: textColor,
                      
                    ),
                    textAlign: TextAlign.center,
                    ),
                    hdivider2,
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                        
                      },
                       child: Text('Next',style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                        ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          minimumSize: Size(150, 50)
                        ),
                        
                        )
                  ],
                ),
              ),
            ),
            ),
        )
        ),
    );
    
  }
}