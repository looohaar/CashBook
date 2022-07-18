import 'package:cash_book/screens/onboarding/screen_onboarding2.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double mediaqueryHeight= MediaQuery.of(context).size.height;
     double mediaqueryWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      body:SafeArea(
        
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1)
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
                    SizedBox(
                      height: mediaqueryHeight*0.28,
                      width: double.infinity,
                      child: Image(image: AssetImage('assets/images/purse.png')),
              
                    ),
                         hdivider2,
                         Text('Analyze Your Spending',
                         style: GoogleFonts.signika(
                fontSize: mediaqueryHeight*0.039,
                
                fontWeight: FontWeight.w700,
                color:headingColor,
              
                         ),
                         ),
                         hdivider2,
                         Text('CashBook makes it easy for you to keep an eye on your spending.It will provide you visual representations like charts,graphs etc to make yourself realise the way you spend.',
              
                         style: GoogleFonts.signika(
                textStyle:  TextStyle(
                fontSize: mediaqueryHeight*0.025,
                color: textColor
                
                         ),
              
                         ),
                         textAlign: TextAlign.center,
                         ),
                         hdivider2,
                         ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding2()));
                },
                child: Text('Next',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),),
                style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                  shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20) ,
                   
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