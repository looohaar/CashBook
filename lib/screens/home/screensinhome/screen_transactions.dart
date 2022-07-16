
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
           backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 300,
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
                    height: 220,
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
                              SizedBox(height: 40,
                              width: 1000,
                                child: FittedBox(
                                  child: Text(greetingMessage(),
                                  style: GoogleFonts.signika(
                                    fontSize: 33,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,),
                                ),
                              ),
                              hdivider1,
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               
                                Text(
                                  DateFormat('EE').format(DateTime.now()),
                                  style: GoogleFonts.signika(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 232, 124, 247),
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                SizedBox(child:Text(',',style: GoogleFonts.signika(color: Color.fromARGB(255, 221, 91, 238),fontSize: 22,fontWeight: FontWeight.w500),),

                                  width: 8,
                                ),
                                     Text(
                                      DateFormat('dd MMM').format(DateTime.now()),
                                      style: GoogleFonts.signika(
                                        fontSize: 25,
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
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                              hdivider1,
                              SizedBox(
                                height: 40,
                                width: 1000,
                                child: FittedBox(
                                  child: Text(
                                    '₹ ${totalIncome - totalExpense}',
                                    style: GoogleFonts.signika(
                                      fontSize: 30,
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
              hdivider2,
              Container(
                child: Column(
                  children: [
                    Text(
                      'All Transactions',
                      style: GoogleFonts.signika(
                      
                          fontSize: 30,
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
                              SizedBox(height:130,),
                              Padding(
                                padding: const EdgeInsets.all(48.0),
                                child: Text(
                                  'No Transactions Found',
                                  style: GoogleFonts.signika(
                                      fontSize: 28,
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
                                              fontSize: 30, color: buttonColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        content: Text(
                                          'Are You Sure You Want To Delete ?',
                                          style: GoogleFonts.signika(
                                              fontSize: 20,
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
                                                      fontSize: 20,
                                                     ))),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('No',
                                                  style: GoogleFonts.signika(
                                                    fontSize: 20,
                                                   
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
                                      SizedBox(height: 12),
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
                                              height: 55,
                                              width: 60,
                                              
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
                                                              fontSize: 18,
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
                                                              fontSize: 18,
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
                                            SizedBox(width: 20
                                            ),
                                            

                                            Container(
                                              decoration: BoxDecoration(color: Color.fromARGB(220, 246, 214, 251)),
                                              height: 70,
                                              width:  290,
                                              child: Row(
                                                
                                                children: [
                                                  SizedBox(width: 15,),
                                                  CircleAvatar(
                                                    backgroundColor: buttonColor,
                                                    child: transactionTileList[index].transactionType
                                                    ?Icon(Icons.arrow_downward_sharp,color: Colors.white,size: 30,)
                                                    : Icon(Icons.arrow_upward_sharp,color: Colors.white,size: 30,),
                                                    
                                                    radius: 25,
                                                  ),
                                                  SizedBox(width: 15,),
                                                  Column(
                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                  
                                                    children: [
                                                    
                                                      Text(
                                                        transactionTileList[index]
                                                            .categories,
                                                        style: GoogleFonts.signika(
                                                            fontSize: 25,
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
                                                             fontSize: 25,
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
                                    SizedBox(height: 13,)
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


String greetingMessage(){
  var presentTime = DateTime.now().hour;
  if((presentTime<12)&& (presentTime>6)){
    return 'Hi ${finalName}, Good Morning!';
  }
  else if((presentTime>11 && (presentTime<16))){
    return 'Have A Good Afternoon ${finalName}';
  }
  else if((presentTime>15 && (presentTime<20))){
    return 'Hi ${finalName}, Good Evening!';
  }
  else{
    return 'Time for bed!';
  }
}

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
