
import 'dart:math';
import 'dart:ui';

import 'package:cash_book/main.dart';
import 'package:cash_book/screens/home/screensinhome/screen_addtransactions.dart';
import 'package:cash_book/screens/home/screensinhome/screen_categories.dart';
import 'package:cash_book/screens/splash/screen_splash.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

import '../../../models/model_class.dart';
import '../subscreens/editTransactions.dart';

class TransactionHistory extends StatefulWidget {
  TransactionHistory();

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  // var name;
  @override
  void initState(){
    super.initState();
    // greetingMessage();
  }

  @override
  Widget build(BuildContext context) {
    double mediaqueryHeight= MediaQuery.of(context).size.height;
    double mediaqueryWidth= MediaQuery.of(context).size.width;
    SizedBox hdivider1= SizedBox(height: mediaqueryHeight*0.0155,);
    SizedBox hdivider2= SizedBox(height: mediaqueryHeight*0.02325,);
     var presentTime = DateTime.now().hour;
    
    return SafeArea(
        child: Scaffold(
           backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        // apply mediaquery
        toolbarHeight: mediaqueryHeight*0.366,
        shadowColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: transactionsVariable.listenable(),
                builder: (BuildContext context, Box<Transactions> newBox,
                    Widget? child) {
                  List<Transactions> transactionList = newBox.values.toList();
                  double totalIncome = totalAmount(transactionList)[0];
                  double totalExpense = totalAmount(transactionList)[1];

                  return Container(
                    height: mediaqueryHeight*0.28,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54, width: 3),
                        gradient: LinearGradient(
                          colors: [
                           
                           
                            
                              Color.fromARGB(255, 24, 1, 65), 
                              buttonColor,

                          
                            
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Column(
                            
                            children: [
                              // apply mediaquery
                              SizedBox(height: mediaqueryHeight*0.059,
                                width: double.infinity,
                                child: FittedBox(
                                child: ValueListenableBuilder(
                                  valueListenable: usernameVariable.listenable(),
                                  builder: (context, Box<Username> newBox, child) {
                                    List<Username> userNameList= newBox.values.toList();
                                    
                                    return Text(

                                    ((presentTime<12)&& (presentTime>6))
                                    ? 'Hi ${userNameList[0].userName}, Good Morning!'
                                    :((presentTime>11 && (presentTime<16)))
                                    ?'Good Afternoon ${userNameList[0].userName}'
                                    :((presentTime>15 && (presentTime<20)))
                                    ?'Hi ${userNameList[0].userName}, Good Evening!'
                                    :'Time for bed!',
                                      
                                   
                     



                                        style: GoogleFonts.signika(
                                      fontSize: mediaqueryWidth*0.08,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                    );
                                    
                                  },
                                 
                                ),
                            
                                    // child: Text(
                                      
                                    //   greetingMessage(),
                                    // style: GoogleFonts.signika(
                                    //   fontSize: mediaqueryWidth*0.08,
                                    //   color: Colors.white,
                                    // ),
                                    // textAlign: TextAlign.center,),
                                 
                                ),
                              ),
                              hdivider1,
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               
                                Text(
                                  DateFormat('EE').format(DateTime.now()),
                                  style: GoogleFonts.signika(
                                    fontSize: mediaqueryWidth*0.068,
                                    color: Color.fromARGB(255, 232, 124, 247),
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(child:Text(',',style: GoogleFonts.signika(color: Color.fromARGB(255, 221, 91, 238),fontSize: mediaqueryWidth*0.065,fontWeight: FontWeight.w500),),

                                  width: mediaqueryWidth*0.02
                                ),
                                     Text(
                                      DateFormat('dd MMM').format(DateTime.now()),
                                      style: GoogleFonts.signika(
                                        fontSize: mediaqueryWidth*0.068,
                                        color: Color.fromARGB(255, 232, 124, 247),
                                        fontWeight: FontWeight.w600
                                      ),

                                     )
                                                    
                              ],
                             ),
                             hdivider2,
                              Text(
                                'Total Balance',
                                style: GoogleFonts.signika(
                                    fontSize:mediaqueryWidth*0.08,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              hdivider1,
                              SizedBox(
                                height: mediaqueryHeight*0.05,
                                width: double.infinity,
                                child: FittedBox(
                                  child: Text(
                                    '₹ ${totalIncome - totalExpense}',
                                    style: GoogleFonts.signika(
                                      fontSize: mediaqueryWidth*0.07,
                                      color: totalIncome - totalExpense < 0
                                          ? expenseColor
                                          : incomeColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
                hdivider1,
            
            
              Container(
                child: Column(
                  children: [
                    Text(
                      'All Transactions',
                      style: GoogleFonts.signika(
                      
                          fontSize: mediaqueryWidth*0.0755,
                          color: headingColor,
                          fontWeight: FontWeight.w700),
                    
                    ),
                   
                  ],
                ),
                
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              ValueListenableBuilder(
                  valueListenable: transactionsVariable.listenable(),
                  builder: (BuildContext context, Box<Transactions> newBox,
                      Widget? child) {
                    List<Transactions> transactionTileList =
                        newBox.values.toList();
                    return transactionTileList.length == 0 ||
                            transactionTileList.isEmpty ||
                            transactionTileList.length == null
                        ? Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // apply mediaquery
                              SizedBox(height:mediaqueryHeight*0.15,),
                              Padding(
                                padding: const EdgeInsets.all(48.0),
                                child: Text(
                                  'No Transactions Found',
                                  style: GoogleFonts.signika(
                                      fontSize:mediaqueryWidth*0.071,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        )
                        : ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onLongPress: () => showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Delete Transaction',
                                          style: GoogleFonts.signika(
                                              fontSize: mediaqueryWidth*0.07, color: buttonColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Text(
                                          'Are You Sure You Want To Delete ?',
                                          style: GoogleFonts.signika(
                                              fontSize: mediaqueryWidth*0.057,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                newBox.delete(
                                                    transactionTileList[index]
                                                        .key);
                                                Navigator.pop(context);
                                              },
                                              child: Text('Yes',
                                                  style: GoogleFonts.signika(
                                                      fontSize: mediaqueryWidth*0.052,
                                                     ))),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('No',
                                                  style: GoogleFonts.signika(
                                                    fontSize: mediaqueryWidth*0.052,
                                                   
                                                  )))
                                        ],
                                      );
                                    }),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditTransaction(
                                               editTransactiionKey: transactionTileList[index],
                                               


                                              )));
                                },

                                child: Column(
                                  children: [
                                      SizedBox(height:  mediaqueryWidth*0.031),
                                    Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: mediaqueryHeight*0.072,
                                              width: mediaqueryWidth*0.15,
                                              
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: [
                                                  
                                                        Color.fromARGB(255, 24, 1, 65), 
                                                            
                                                               buttonColor,

                                                ],
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                ),
                                                
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      DateFormat('EE').format(
                                                          transactionTileList[
                                                                  index]
                                                              .date),
                                                      style:
                                                          GoogleFonts.signika(
                                                              fontSize:  mediaqueryWidth*0.051,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                    Text(
                                                      DateFormat('dd MMM').format(
                                                          transactionTileList[
                                                                  index]
                                                              .date),
                                                      style:
                                                          GoogleFonts.signika(
                                                              fontSize:mediaqueryWidth*0.05,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: mediaqueryWidth*0.05,
                                            ),
                                            

                                            Container(
                                              decoration: BoxDecoration(color: Color.fromARGB(220, 246, 214, 251)),
                                              height: mediaqueryHeight*0.08,
                                              width:  mediaqueryWidth*0.749,
                                              child: Row(
                                                
                                                children: [
                                                  SizedBox(width: mediaqueryWidth*0.025,),
                                                  CircleAvatar(
                                                    backgroundColor: buttonColor,
                                                    child: transactionTileList[index].transactionType
                                                    ?Icon(Icons.arrow_downward_sharp,color: Colors.white,size: mediaqueryWidth*0.08,)
                                                    : Icon(Icons.arrow_upward_sharp,color: Colors.white,size:mediaqueryWidth*0.08,),
                                                    
                                                    radius: mediaqueryWidth*0.06,
                                                  ),
                                                  SizedBox(width: mediaqueryWidth*0.05,),
                                                  Column(
                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                  
                                                    children: [
                                                    
                                                      Text(
                                                        transactionTileList[index]
                                                            .categories,
                                                        style: GoogleFonts.signika(
                                                            fontSize: mediaqueryWidth*0.065,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: transactionTileList[
                                                                        index]
                                                                    .transactionType
                                                                ? tileIncomeColor
                                                                : tileExpenseColor),
                                                        maxLines: 1,
                                                      ),
                                                      Visibility(
                                                        visible: false,
                                                        child: Text(
                                                          transactionTileList[index].notes,
                                                          
                                                        ),
                                                      ),
                                                      // **********************
                                                       Text(
                                                             '₹ ${transactionTileList[index].amount}',
                                                              style: GoogleFonts.signika(
                                                             fontSize: mediaqueryWidth*0.06,
                                                           fontWeight: FontWeight.bold,
                                                           color: Colors.black54),
                                                           overflow: TextOverflow.ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                    ],
                                                  ),
                                                  
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                      ],
                                    ),
                                    SizedBox(height:  mediaqueryWidth*0.031)
                                  ],
                                ),

                              

                               
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return  SizedBox(
                                height: 3,
                                child: Container(
                                  color: headingColor,
                                  child: Text(''),
                                ),
                              );
                            },
                            itemCount: transactionTileList.length,
                          );
                  }
                  )
            ],
          ),
        ),
      ),
    ));
  }


// String greetingMessage(){
 
//   if((presentTime<12)&& (presentTime>6)){
//     return 'Hi ${userNameList[0].userName}, Good Morning!';
//   }
//   else if((presentTime>11 && (presentTime<16))){
//     return 'Good Afternoon ${userNameList[0].userName}';
//   }
//   else if((presentTime>15 && (presentTime<20))){
//     return 'Hi ${userNameList[0].userName}, Good Evening!';
//   }
//   else{
//     return 'Time for bed!';
//   }
// }

}

List<Transactions> transactionHistory(Box<Transactions> box) {
  List<Transactions> list = transactionsVariable.values.toList();
  List<Transactions> transactionlist = [];
  for (int i = 0; i < list.length; i++) {
    transactionlist.add(list[i]);
  }
  return transactionlist;
}

List<double> totalAmount(List<Transactions> list) {
  double totalIncome = 0;
  double totalExpense = 0;
  List<double> totalAmountList = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i].transactionType == true) {
      totalIncome = totalIncome + list[i].amount;
    } else {
      totalExpense = totalExpense + list[i].amount;
    }
  }
  totalAmountList.add(totalIncome);
  totalAmountList.add(totalExpense);
  return totalAmountList;
}