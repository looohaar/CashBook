import 'dart:ui';

import 'package:cash_book/main.dart';
import 'package:cash_book/screens/home/screensinhome/screen_addtransactions.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

import '../../../models/model_class.dart';

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
          body: Padding(padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: transactionsVariable.listenable(),
                builder: (BuildContext context, Box<Transactions> newBox, Widget? child){
                  List<Transactions> transactionList= newBox.values.toList();
                  double totalIncome= totalAmount(transactionList)[0];
                  double totalExpense= totalAmount(transactionList)[1];

                  return Container(
                    height: 220,
                    // width: double.infinity,
                    // color: buttonColor,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            // Colors.white,
                            buttonColor,
                            Color.fromARGB(255, 20, 2, 46),
                          ],
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        // *****************Total Balance**********************************
                        children: [
                          Text(
                            'Total Balance',
                            style: GoogleFonts.signika(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          hdivider1,
                          Text(
                            'Rs. ${totalIncome - totalExpense}',
                            style: GoogleFonts.signika(
                              fontSize: 30,
                              color: totalIncome - totalExpense< 0 ?expenseColor:incomeColor,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          hdivider2,
                          //  *****************************************Income ***************************************
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Income',
                                    style: GoogleFonts.signika(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  hdivider1,
                                  Text(
                                    'Rs. $totalIncome',
                                    style: GoogleFonts.signika(
                                      fontSize: 25,
                                      color: incomeColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
              
                              // ****************************Expense*****************************************************************************
                              Column(
                                children: [
                                  Text(
                                    'Expense',
                                    style: GoogleFonts.signika(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  hdivider1,
                                  Text(
                                    'Rs.$totalExpense',
                                    style: GoogleFonts.signika(
                                      fontSize: 25,
                                      color: expenseColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
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
                child: Text('All Transactions',style: GoogleFonts.signika(
                  fontSize: 30,
                  color: headingColor,
                  fontWeight: FontWeight.w700
                ),),
              ),
              hdivider2,
               hdivider1,
         
              ValueListenableBuilder(
                valueListenable: transactionsVariable.listenable(), 
                builder: (BuildContext context, Box<Transactions> newBox, Widget? child){
                  List<Transactions> transactionTileList= newBox.values.toList();
                 return transactionTileList.length==0
                 ||transactionTileList.isEmpty||
                 transactionTileList.length== null
                 ?  Center(
                  child: Text('No Transactions Found!',
                  style: GoogleFonts.signika(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey

                  ),
                  ),
                 )
                 : ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onLongPress: ()=>showDialog(
                        context: context,
                         builder: (context){
                          return AlertDialog(
                            title: Text('Delete Transaction',style: GoogleFonts.signika(fontSize: 30,color: buttonColor),
                            textAlign: TextAlign.center,
                            ),
                            content: Text('Are You Sure You Want To Delete ?',style: GoogleFonts.signika(fontSize: 20,color: Colors.black),
                            textAlign: TextAlign.center,),
                            actions: [
                              TextButton(
                                onPressed: (){
                                  newBox.delete(transactionTileList[index].key);
                                  Navigator.pop(context);
                                }, 
                                child: Text('Yes',style: GoogleFonts.signika(fontSize: 20, color: Colors.black)
                                )
                                ),
                                TextButton( onPressed: (){
                                  Navigator.pop(context);
                                }, 
                                child: Text('No',style: GoogleFonts.signika(fontSize: 20, color: Colors.black,)
                                )
                                )
                            ],

                          );
                         }
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTransactions()));
                      },
                      child: CustomTransactionCard(
                        amount: 'Rs. ${transactionTileList[index].amount}',
                         category: transactionTileList[index].categories,
                          color: transactionTileList[index].transactionType? incomeColor: expenseColor,

                           date: DateFormat('EEEE,d MMM').format(transactionTileList[index].date)
                           
                           ),

                    );
                  },
               
                  separatorBuilder: (BuildContext context, int index) { 
                    return const SizedBox.shrink();
                   },
                  
                     itemCount: transactionTileList.length,
                  );
                }
                )
            
            ],
            
          ),
          ),
       )
      );
    
  }
}

List<Transactions> transactionHistory(Box<Transactions> box){
  List<Transactions> list= transactionsVariable.values.toList();
  List<Transactions> transactionlist=[];
  for (int i = 0; i < list.length; i++) {
    transactionlist.add(list[i]);
    
  }
  return transactionlist;
}


List<double> totalAmount(List<Transactions> list){
  double totalIncome=0;
  double totalExpense=0;
  List<double> totalAmountList=[];
  for (int i = 0; i < list.length; i++) {
    if (list[i].transactionType==true) {
      totalIncome=totalIncome + list[i].amount;
      
    }else{
      totalExpense=totalExpense + list[i].amount;
    }
    
  }
  totalAmountList.add(totalIncome);
  totalAmountList.add(totalExpense);
  return totalAmountList;
}