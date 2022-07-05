import 'dart:ffi';


import 'package:cash_book/main.dart';
import 'package:cash_book/screens/home/screensinhome/screen_categories.dart';
import 'package:cash_book/screens/home/subscreens/addCategory.dart';
import 'package:cash_book/utils/dateformats.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import '../../../models/model_class.dart';
import '../../../utils/colors.dart';



class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> with TickerProviderStateMixin {
  Color? tabColor = incomeColor;
  TabController? tabController;
  String popupItem='Monthly';
  DateTime monthlyYearly= DateTime.now();
  late List<Transactions> firstFilterList;
  // var trnasBox= Hive.box<Transactions>
  @override
  void initState() {
    // TODO: implement initState
    indexController = 0;
    tabController = TabController(length: 2, vsync: this);
    firstFilterList=monthlyandyearlyLists(transactionsVariable)[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        //   actions: [

        //     Padding(
        //       padding: const EdgeInsets.only(right: 50,top: 15),
        //       child: Text('Monthly',style: GoogleFonts.signika(fontSize: 24,)
        // ),
        //     )],
          centerTitle: true,
          title: Text(
            'Statistics',
            style: GoogleFonts.signika(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          elevation: 0,
        ),
        body: DefaultTabController(
            length: 2,
            child: Column(children: [
              Builder(builder: (context) {
                tabController = DefaultTabController.of(context)!;
                tabController!.addListener(() {
                  setState(() {
                    indexController = tabController!.index;
                    if (indexController == 0) {
                      tabColor = incomeColor;
                    } else {
                      tabColor = expenseColor;
                    }
                    // tabColor= Color.fromARGB(255, 20, 2, 46);
                  });
                });
                // nthelum issues vannal TabBar Column il wrap chydo
                return TabBar(
                    padding: EdgeInsets.all(30),
                    indicator: BoxDecoration(
                      color: tabColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.black45,
                    tabs: [
                      Tab(
                        child: Text(
                          'Income',
                          style: GoogleFonts.signika(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Expense',
                          style: GoogleFonts.signika(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ]);
              }
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // e onpressed onnude chydo
                        IconButton(onPressed: (){
                          setState(() {
                            if (popupItem=='Monthly') {
                              monthlyYearly=DateTime(monthlyYearly.year,monthlyYearly.month-1);
                              firstFilterList=monthlyandyearlyLists(transactionsVariable)[0];
                            }else if(popupItem=='Yearly'){
                                      monthlyYearly=DateTime(
                                        monthlyYearly.year-1,
                                        monthlyYearly.month
                                      );
                                      firstFilterList= monthlyandyearlyLists(transactionsVariable)[0];
                            }
                          });
                        },
                         icon: Icon(Icons.keyboard_arrow_left,
                         color: headingColor,
                         size: 35,)),
                         Text(
                          popupItem=='Monthly'?
                          dateFormatMonth.format(monthlyYearly)
                          : monthlyYearly.year.toString(),
                          style: GoogleFonts.signika(
                            fontSize: 25,
                            color: headingColor,
                            fontWeight: FontWeight.w600
                          ),
                          

                         ),
                         IconButton(onPressed: (){},
                          icon: Icon(Icons.keyboard_arrow_right,size: 35,color: headingColor,)
                          )
                      ],

                    ),
                    PopupMenuButton(itemBuilder: (context)=>[
                      PopupMenuItem(child: Text('Monthly',style: GoogleFonts.signika(fontSize: 20,color: Colors.black),)),
                      PopupMenuItem(child: Text('Yearly',style: GoogleFonts.signika(fontSize: 20,color: Colors.black),)),
                      
                    ],
                    child: Padding(padding: EdgeInsets.only(right: 10),
                    child: Container(

                      
                      decoration: BoxDecoration(
                        
                        border: Border.all(color: headingColor,width: 3
                        ),
                        borderRadius: BorderRadius.circular(10),
                      

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 5,),
                          // Padding(padding: EdgeInsets.all(10)),
                          Text(popupItem,style: GoogleFonts.signika(fontSize: 23),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.keyboard_arrow_down,size: 30,)
                        ],
                      ),
                     
                    ),),
                    )

                  ],
                ),
              ),
            ]
          )
        )
       );
     }


   List<List<Transactions>> monthlyandyearlyLists(Box <Transactions>monthlyandyearlyListsBox){
    List<Transactions> monthlyList=[];
    List<Transactions> yearlyList=[];
    List<List<Transactions>> monthlyandyearlyLists=[
      monthlyList,
      yearlyList,
    ];
    List<Transactions> allTransactions= transactionsVariable.values.toList();
    for (int i = 0; i < allTransactions.length; i++) {
    if (allTransactions[i].date.year==monthlyYearly.year) {
      yearlyList.add(allTransactions[i]);
      
    }
    if (allTransactions[i].date.month==monthlyYearly.month) {
     monthlyList.add(allTransactions[i]);      
    }
      
    }
    return monthlyandyearlyLists;
   }
   

   }
   
   