import 'package:cash_book/screens/home/screensinhome/screen_addtransactions.dart';
import 'package:cash_book/screens/home/screensinhome/screen_categories.dart';
import 'package:cash_book/screens/home/screensinhome/screen_settings.dart';
import 'package:cash_book/screens/home/screensinhome/screen_statistics.dart';
import 'package:cash_book/screens/home/screensinhome/screen_transactions.dart';
import 'package:cash_book/screens/home/screensinhome/screen_settings.dart';
import 'package:cash_book/screens/home/screensinhome/screen_statistics.dart';
import 'package:cash_book/screens/home/screensinhome/screen_transactions.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  final pages = [
    TransactionHistory(),
    AddTransactions(),
    Statistics(),
    Categories(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Welcome',style: GoogleFonts.signika(
      //     fontSize: 30,
      //     fontWeight: FontWeight.w700
          

      //   ),),
      // ),
      body: pages[pageIndex],
     

      bottomNavigationBar: customNavigationBar(context),
    //  floatingActionButton: pageIndex==0 || pageIndex==1? FloatingActionButton(
    //     onPressed: (){},
    //   child: Icon(Icons.add,),
    //   backgroundColor: buttonColor,
    //   elevation: 0,
    //   // shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(10)),

    //   ): null,
   
   
    );

  }

  Container customNavigationBar (BuildContext context){
  return Container(
    height: 60,
    decoration: BoxDecoration(
      color: buttonColor,
      // borderRadius: BorderRadius.only(
      //   topLeft: Radius.circular(80),
      //   topRight: Radius.circular(80),
      // )

    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: (){
            setState(() {
              pageIndex=0;
            });
          }, 
          icon: pageIndex==0? Icon(Icons.home,color: Colors.white,size: 35,)
                            : Icon(Icons.home_outlined,color: Colors.white,size:35,)
          ),
          IconButton(onPressed: (){
            setState(() {
              pageIndex=1;
            });
          }, icon: pageIndex==1? Icon(Icons.note_add,color: Colors.white,size: 35,)
                               :  Icon(Icons.note_add_outlined,color: Colors.white,size: 35,)                         
           ),
           IconButton(onPressed: (){
            setState(() {
              pageIndex=2;
            });
          }, icon: pageIndex==2? Icon(Icons.analytics,color: Colors.white,size: 35,)
                               :  Icon(Icons.analytics_outlined,color: Colors.white,size: 35,)                         
           ,tooltip: 'Analitics',
          //  splashRadius: 5,
          //  splashColor: Colors.grey,
          // disabledColor: Colors.black,
          
          
           ),
           IconButton(onPressed: (){
            setState(() {
              pageIndex=3;
            });
          }, icon: pageIndex==3? Icon(Icons.category,color: Colors.white,size: 35,)
                               :  Icon(Icons.category_outlined,color: Colors.white,size: 35,)                         
           ),
           IconButton(onPressed: (){
            setState(() {
              pageIndex=4;
            });
          }, icon: pageIndex==4? Icon(Icons.settings,color: Colors.white,size: 35,)
                               :  Icon(Icons.settings_outlined,color: Colors.white,size: 35,)                         
           ),

      ]
      
    ),
    
  );
}

}
