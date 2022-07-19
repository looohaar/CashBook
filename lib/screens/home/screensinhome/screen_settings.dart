

import 'package:cash_book/main.dart';
import 'package:cash_book/screens/home/subscreens/addCategory.dart';
import 'package:cash_book/screens/splash/screen_splash.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../../utils/email.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var name;
  @override
  void initState(){
    super.initState();
    name= finalName;
  }
  @override
  Widget build(BuildContext context) {
    double mediaqueryHeight= MediaQuery.of(context).size.height;
    double mediaqueryWidth= MediaQuery.of(context).size.width;

    
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings',
        style: GoogleFonts.signika(
          fontSize: mediaqueryWidth*0.08,
          fontWeight: FontWeight.w700,
          color: Colors.white,


        ),
        ),
elevation: 0,
      ),
      
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Padding(
          
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
           
            children: [
              SizedBox(
                height: mediaqueryHeight*0.038,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: headingColor,
                    size: mediaqueryWidth*0.085,
                  ),
                  title: Text(finalName,
                  style: GoogleFonts.signika(
                    fontSize: mediaqueryWidth*0.07,
              
                  ),),
                ),
              ),
              hdivider2,
               hdivider2,
              SizedBox(
                height:  mediaqueryHeight*0.038,
                
                  child: GestureDetector(
                    onTap: ()=> showDialog(
                      context: context, 
                      builder: (context){
                        return AlertDialog(
                          title: Text('Reset Data',style: GoogleFonts.signika(fontSize: mediaqueryWidth*0.07,color: buttonColor,fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,),
                          content: Text('Do You Want To Reset Data ?',
                           style: GoogleFonts.signika(
                            fontSize:mediaqueryWidth*0.057,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          ),
                          actions: [
                            TextButton(onPressed: (){
                              categoryVariable.clear();
                              transactionsVariable.clear();
                              Navigator.pop(context);

                            },
                             child: Text('Yes',
                             style: GoogleFonts.signika(
                              color: buttonColor,
                              fontSize: mediaqueryWidth*0.052,

                              
                             ),)),
                             TextButton(onPressed: (){
                              Navigator.pop(context);
                             },
                              child: Text('No',
                              style: GoogleFonts.signika(
                                color: buttonColor,
                                fontSize: mediaqueryWidth*0.052,
                              ),))
                          ],


                
                        );
                      }, 
                   ),
                   child: ListTile(
                    leading: Icon(Icons.refresh_sharp,color: headingColor,size: mediaqueryWidth*0.0878,),
                    title: Text('Reset Data',
                    style:GoogleFonts.signika(
                      fontSize: mediaqueryWidth*0.07
                    ),),
                   )
                  ),
              
              ),
              hdivider2,
              hdivider2,
              SizedBox(
                height:  mediaqueryHeight*0.038,
                child: GestureDetector(
                 
                  onTap: ()=> emailLauncher(),
                 
                  child: ListTile(
                    leading: Icon(Icons.email,color: headingColor,size: mediaqueryWidth*0.08,),

                    title: Text('Feedback',style: GoogleFonts.signika(fontSize: mediaqueryWidth*0.07,color: Colors.black),),
                  ),
                ),
              ),
              hdivider2,
              hdivider2,
              SizedBox(
                height:  mediaqueryHeight*0.038,
                child: GestureDetector(
                  onTap: ()=>Share.share('Hi,please be kind to check out this moneymanager application. I assure you tht this appliction will help you in your Financial journey ..#url kodukanam upload chyd kazhinjit'),
                  child: ListTile(
                    leading: Icon(Icons.share_sharp,color: headingColor,size: mediaqueryWidth*0.084,),
                    title: Text('Share App',
                    style: GoogleFonts.signika(fontSize: mediaqueryWidth*0.07,color: Colors.black),),
                  ),
                ),
              ),
              hdivider2,
              hdivider2,
            SizedBox(
              height:  mediaqueryHeight*0.038,
              child: GestureDetector(
                onTap: (){

                },
                child: ListTile(
                  leading: Icon(Icons.star,color: headingColor,size: mediaqueryWidth*0.087,),
                  title: Text('Rate App',style: GoogleFonts.signika(fontSize:mediaqueryWidth*0.07,color: Colors.black),

                ),
              ),
            ),
           ),
           hdivider2,
           hdivider2,
           SizedBox(
            height:  mediaqueryHeight*0.038,
            child: GestureDetector(
              // onTap: ()=> 
              child: ListTile(
                leading: Icon(Icons.privacy_tip_outlined,color: headingColor,size:mediaqueryWidth*0.084,),
                title: Text('Privacy Policy',style: GoogleFonts.signika(fontSize: mediaqueryWidth*0.07,color: Colors.black),
              ),
            ),
          
           ),
       
          


           ) ,
                hdivider2,
                hdivider2,
                SizedBox(
                  height:  mediaqueryHeight*0.038,
              child: GestureDetector(
                onTap: ()=> aboutmeLauncher(),
                child: ListTile(
                  leading: Icon(Icons.info,color: headingColor,size:mediaqueryWidth*0.086,),
                  title: Text('About Me',style: GoogleFonts.signika(fontSize: mediaqueryWidth*0.07,color: Colors.black),),
                  
                ),
              ),
              
                ),
               SizedBox(height: mediaqueryHeight*0.26),
                SizedBox(
                  height: mediaqueryHeight*0.038,
                  child: Center(
                    child: Text('Version 1.0.0',
                    style: GoogleFonts.signika(fontSize: mediaqueryWidth*0.05,color: Colors.grey,),),

                  ),
                )

           ],

          ),
        ),
      ),
    );
    
  }
}