

import 'package:cash_book/main.dart';
import 'package:cash_book/screens/home/subscreens/addCategory.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings',
        style: GoogleFonts.signika(
          fontSize: 30,
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
            // mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 30,
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: headingColor,
                    size: 35,
                  ),
                  title: Text('Name',
                  style: GoogleFonts.signika(
                    fontSize: 25,
              
                  ),),
                ),
              ),
              hdivider2,
               hdivider2,
              SizedBox(
                height: 30,
                
                  child: GestureDetector(
                    onTap: ()=> showDialog(
                      context: context, 
                      builder: (context){
                        return AlertDialog(
                          title: Text('Reset Data',style: GoogleFonts.signika(fontSize: 25,color: buttonColor,fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,),
                          content: Text('Do You Want To Reset Data ?',
                           style: GoogleFonts.signika(
                            fontSize:20,
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
                              fontSize: 18

                              
                             ),)),
                             TextButton(onPressed: (){
                              Navigator.pop(context);
                             },
                              child: Text('No',
                              style: GoogleFonts.signika(
                                color: buttonColor,
                                fontSize: 18
                              ),))
                          ],


                
                        );
                      }, 
                   ),
                   child: ListTile(
                    leading: Icon(Icons.refresh_sharp,color: headingColor,size: 35,),
                    title: Text('Reset Data',
                    style:GoogleFonts.signika(
                      fontSize: 25
                    ),),
                   )
                  ),
              
              ),
              hdivider2,
              hdivider2,
              SizedBox(
                height: 30,
                child: GestureDetector(
                  onTap: ()=> EmailAndUrl.openEmail(
                    toEmail: 'looohaar@gmail.com',
                    subject: 'Feedback about CashBook',
                  ),
                  child: ListTile(
                    leading: Icon(Icons.email,color: headingColor,size: 30,),

                    title: Text('Feedback',style: GoogleFonts.signika(fontSize: 25,color: Colors.black),),
                  ),
                ),
              ),
              hdivider2,
              hdivider2,
              SizedBox(
                height: 30,
                child: GestureDetector(
                  onTap: ()=>Share.share('Hi,please be kind to check out this moneymanager application. I assure you tht this appliction will help you in your Financial journey ..#url kodukanam upload chyd kazhinjit'),
                  child: ListTile(
                    leading: Icon(Icons.share_sharp,color: headingColor,size: 30,),
                    title: Text('Share App',
                    style: GoogleFonts.signika(fontSize: 25,color: Colors.black),),
                  ),
                ),
              ),
              hdivider2,
              hdivider2,
            SizedBox(
              height: 30,
              child: GestureDetector(
                onTap: (){

                },
                child: ListTile(
                  leading: Icon(Icons.star,color: headingColor,size: 33,),
                  title: Text('Rate App',style: GoogleFonts.signika(fontSize:25,color: Colors.black),

                ),
              ),
            ),
           ),
           hdivider2,
           hdivider2,
           SizedBox(
            height: 30,
            child: GestureDetector(
              onTap: ()=> EmailAndUrl.openLink(url: 'app upload chydit url kodknam'),
              child: ListTile(
                leading: Icon(Icons.privacy_tip_outlined,color: headingColor,size: 30,),
                title: Text('Privacy Policy',style: GoogleFonts.signika(fontSize: 25,color: Colors.black),
              ),
            ),
          
           ),
       
          


           ) ,
            hdivider2,
                hdivider2,
                SizedBox(
                  height: 30,
              child: GestureDetector(
                onTap: ()=>EmailAndUrl.openLink(url: 'www.linkedin.com/in/rahul-rajeev-500b1b200'),
                child: ListTile(
                  leading: Icon(Icons.info,color: headingColor,size: 35,),
                  title: Text('About Me',style: GoogleFonts.signika(fontSize: 25,color: Colors.black),),
                  
                ),
              ),
              
                ),
               SizedBox(height: 225),
                SizedBox(
                  height: 30,
                  child: Center(
                    child: Text('Version 1.0',
                    style: GoogleFonts.signika(fontSize: 20,color: Colors.grey,),),

                  ),
                )

           ],

          ),
        ),
      ),
    );
    
  }
}