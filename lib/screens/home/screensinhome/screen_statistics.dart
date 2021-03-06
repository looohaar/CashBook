import 'dart:ffi';



import 'package:cash_book/main.dart';
import 'package:cash_book/screens/home/screensinhome/screen_categories.dart';
import 'package:cash_book/screens/home/subscreens/addCategory.dart';
import 'package:cash_book/utils/dateformats.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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
    double mediaqueryHeight= MediaQuery.of(context).size.height;
    double mediaqueryWidth= MediaQuery.of(context).size.width;
    SizedBox hdivider1= SizedBox(height: mediaqueryHeight*0.0155,);
     SizedBox hdivider2= SizedBox(height: mediaqueryHeight*0.02325,);
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
      automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Statistics',
            style: GoogleFonts.signika(
              fontSize: mediaqueryWidth*0.08,
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
                            fontSize: mediaqueryWidth*0.075,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Expense',
                          style: GoogleFonts.signika(
                            fontSize: mediaqueryWidth*0.075,
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
                                        // nextline conmment chyd check chyd nok
                                        // monthlyYearly.month
                                      );
                                      firstFilterList= monthlyandyearlyLists(transactionsVariable)[1];
                            }
                          });
                        },
                         icon: Icon(Icons.keyboard_arrow_left,
                         color: headingColor,
                         size:  mediaqueryWidth*0.095)),
                         Text(
                          popupItem=='Monthly'?
                          dateFormatMonth.format(monthlyYearly).toString()
                          : monthlyYearly.year.toString(),
                          style: GoogleFonts.signika(
                            fontSize:  mediaqueryWidth*0.065,
                            color: headingColor,
                            fontWeight: FontWeight.w600
                          ),
                          

                         ),
                         IconButton(onPressed: (){
                          setState(() {
                            if (popupItem=='Monthly') {
                                monthlyYearly=DateTime(monthlyYearly.year,monthlyYearly.month+1);
                                firstFilterList=monthlyandyearlyLists(transactionsVariable)[0];

                              
                            }else{
                              monthlyYearly=DateTime(monthlyYearly.year+1,
                              // monthlyYearly.month
                              );
                              firstFilterList=monthlyandyearlyLists(transactionsVariable)[1];
                            
                            }
                          });
                         },
                          icon: Icon(Icons.keyboard_arrow_right,size:  mediaqueryWidth*0.095,color: headingColor,)
                          )
                      ],

                    ),
                    
                    PopupMenuButton(

                      onSelected: (value){
                       setState(() {
                          if (value!=null) {
                          if ((value=='Monthly')) {
                          
                            setState(() {
                                monthlyYearly=DateTime.now();
                            firstFilterList=monthlyandyearlyLists(transactionsVariable)[0];
                            popupItem=value.toString();
                            });
                            
                          }else if(value=='Yearly'){
                           
                            setState(() {
                               monthlyYearly=DateTime.now();
                            firstFilterList=monthlyandyearlyLists(transactionsVariable)[1];
                            popupItem=value.toString();
                            });
                          }
                          
                        }
                       });
                      },
                      initialValue: popupItem,
                      itemBuilder: (context)=>[
                        // no mediaquery applied
                      PopupMenuItem(child: Text('Monthly',style: GoogleFonts.signika(fontSize: 20,color: Colors.black),),value: 'Monthly',),
                      PopupMenuItem(child: Text('Yearly',style: GoogleFonts.signika(fontSize: 20,color: Colors.black),),value: 'Yearly',),
                      
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
                          SizedBox(width:  mediaqueryWidth*0.0095,),
                        // dfsasfddsfdsfsdfdsfsdfs
                          Text(popupItem,style: GoogleFonts.signika(fontSize: mediaqueryWidth*0.06),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.keyboard_arrow_down,size: 30,)
                        ],
                      ),

                   
                    ),
                    ),
                    )

                  ],
                ),
              ),
              hdivider2,
              SizedBox(
                height: 25,
                child: Text(
                  tabController!.index==0
                  ?'Total Income : ${incomeSum(firstFilterList)}'
                  : 'Total Expense : ${expenseSum(firstFilterList)}',
                  style: GoogleFonts.signika(fontSize:  mediaqueryWidth*0.065, fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(child: 
              Padding(padding: EdgeInsets.all(10),
              child: ((getChartExpense(firstFilterList).isEmpty&& tabController!.index==1)
              || (getChartIncome(firstFilterList).isEmpty && tabController!.index==0))
              ?Center(
                child: Text('No Data Found',
                style: GoogleFonts.signika(fontSize: mediaqueryWidth*0.07,fontWeight:FontWeight.w700,color: Colors.grey,),),
              )
              // ? ((getChartExpense(firstFilterList).isEmpty&& tabController!.index==1 && monthlyYearly.year+1))
              : SfCircularChart(
                
                centerY: '160',
                legend: Legend(
                  position: LegendPosition.bottom,
                  textStyle: GoogleFonts.signika(
                  fontSize: mediaqueryWidth*0.055
                  ),
                  overflowMode: LegendItemOverflowMode.scroll,
                  // offset: Offset(-1000, -140),
                  // offset: Offset(-1000, -50),
                  // offset: Offset(-140, 350),
                  isVisible: true,
                  isResponsive: true,
                  orientation: LegendItemOrientation.vertical,
                  height: '100%',
                  width: '1000%',
                  iconHeight:  mediaqueryHeight*0.02,
                  iconWidth:  mediaqueryWidth*0.055
                
                ),
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  color: buttonColor,
                  textStyle: GoogleFonts.signika(),

                ),
                palette: colorPalette,
                backgroundColor: Colors.white,
                series: <CircularSeries>[
                  DoughnutSeries<ChartData, String>(
                    strokeColor: Colors.white,
                    strokeWidth: 1,
                    explodeGesture: ActivationMode.singleTap,
                    radius: 120.toString(),
                    dataSource: tabController!.index==0
                    ?getChartIncome(firstFilterList)
                    :getChartExpense(firstFilterList),
                    xValueMapper: (ChartData data, _)=>data.categoryName,
                    yValueMapper: (ChartData data,_)=>data.amount,
                    dataLabelMapper: (ChartData data,_)=>data.percentage,

        dataLabelSettings: DataLabelSettings(
          color: tabController?.index==0? incomeColor:expenseColor,
          connectorLineSettings: const ConnectorLineSettings(
            type: ConnectorType.curve,
          ),
          labelPosition: ChartDataLabelPosition.outside,
          isVisible: true,
          textStyle: GoogleFonts.signika(fontSize:  mediaqueryWidth*0.043),

        )
                     )
                ],

              )
              )
              ,)
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
    // if (allTransactions.where((element) => false)) {
      
    // }
    if (allTransactions[i].date.month==monthlyYearly.month) {
     monthlyList.add(allTransactions[i]);      
    }
      
    }
    return monthlyandyearlyLists;
   }


   List<ChartData> getChartIncome(List<Transactions> transactions){
    final List<ChartData> chartIncomeData=[];
    List<Category> catList= categoryVariable.values.toList();
    for (int i = 0; i < catList.length; i++) {
      double amount=0;
      if (catList[i].transactionType==true) {
        for (int j = 0; j < transactions.length; j++) {
          if (catList[i].categoryName==transactions[j].categories) {
            amount= amount+transactions[j].amount;
          }
        }
        if (amount!=0) {
          var percentage= ((amount.roundToDouble()/incomeSum(firstFilterList))*100).toStringAsFixed(2);
          chartIncomeData.add(ChartData(catList[i].categoryName, amount.round(), '$percentage %'));
        }
      }
    }
    return chartIncomeData;
   }
   List<ChartData> getChartExpense(List<Transactions> transactions){
    final List<ChartData> chartExpenseData=[];
    List<Category> catList= categoryVariable.values.toList();
    for (int i = 0; i < catList.length; i++) {
      double amount=0;
    if (catList[i].transactionType==false) {
      for (int j = 0; j < transactions.length; j++) {
        if (catList[i].categoryName==transactions[j].categories) {
          amount= transactions[j].amount+ amount;
        }       
      }
      if (amount!=0) {
        var percentage= ((amount.roundToDouble()/expenseSum(firstFilterList))*100).toStringAsFixed(2);
        chartExpenseData.add(ChartData(catList[i].categoryName, amount.round(), '$percentage %'));

        
      }
      
    }
      
    }
    return chartExpenseData;
    
   }
   }
   class ChartData{
    final String categoryName;
    final int amount;
    final String percentage;
    ChartData(this.categoryName,this.amount, this.percentage);
   }
   
   double incomeSum(List<Transactions> list){
    double totalIncome=0;
    for (int i = 0; i < list.length; i++) {
      if (list[i].transactionType==true) {
        totalIncome= list[i].amount+ totalIncome;
        
      }
      
    }
    return totalIncome;
   }
   double expenseSum(List<Transactions>list){
    double totalExpense=0;
    for (int i = 0; i < list.length; i++) {
      if (list[i].transactionType==false) {
        totalExpense= list[i].amount+ totalExpense;
        
      }
      
    }
    return totalExpense;
   }

// List<Transactions> yearlyList(List<Transactions> yearlyList){
//   List<Transactions> yearlyList= transactionsVariable.values.toList();
//   if (yearlyList.) {
    
//   }
// }

   