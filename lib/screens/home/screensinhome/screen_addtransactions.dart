import 'dart:ffi';
import 'dart:html';

import 'package:cash_book/screens/home/screensinhome/screen_categories.dart';
import 'package:cash_book/screens/home/widgets/showCategory.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:cash_book/utils/dateformats.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTransactions extends StatefulWidget {
  const AddTransactions({Key? key}) : super(key: key);

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  TabController? tabController;
  late DateTime initialDate;
  Color? tabColor = incomeColor;
  String categorySelect = "";
  final dateController = TextEditingController();
  final categoryController = TextEditingController();
  final amountController = TextEditingController();
  final notesContorller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    indexController = 0;
    initialDate = DateTime.now();
    dateController.text = dateformatFull.format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Transactions',
          style: GoogleFonts.signika(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
          child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Builder(builder: (BuildContext context) {
              tabController = DefaultTabController.of(context)!;
              tabController!.addListener(() {
                setState(() {
                  indexController = tabController!.index;
                  if (tabController!.index == 0) {
                    tabColor = incomeColor;
                  } else {
                    tabColor = expenseColor;
                  }
                  // categoryController.text= '';
                });
              });
              //  if (tabController!.indexIsChanging) {
              //       categorySelect = "";
              //     }

              return Column(
                children: [
                  TabBar(
                    padding: EdgeInsets.all(30),
                    indicator: BoxDecoration(
                        color: tabColor,
                        borderRadius: BorderRadius.circular(20)),
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
                      )
                    ],
                  )
                ],
              );
            }),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Padding(padding: EdgeInsets.symmetric(horizontal:100 )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 150,
                            child: Text(
                              'Date',
                              style: GoogleFonts.signika(fontSize: 25),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(textScaleFactor: 1),
                              child: TextField(
                                readOnly: true,
                                enableInteractiveSelection: false,
                                onTap: () {
                                  showDatePicker(
                                          builder: (context, child) {
                                            return MediaQuery(
                                              data: MediaQuery.of(context)
                                                  .copyWith(textScaleFactor: 3),
                                              child: Theme(
                                                  data: ThemeData(
                                                    colorScheme:
                                                        ColorScheme.light(
                                                      primary: buttonColor,
                                                    ),
                                                  ),
                                                  child: child!),
                                            );
                                          },
                                          context: context,
                                          initialDate: initialDate,
                                          firstDate: DateTime(
                                              DateTime.now().year - 10),
                                          lastDate: DateTime.now())
                                      .then((value) {
                                    setState(() {
                                      if (value != null) {
                                        initialDate = value;
                                        dateController.text =
                                            dateformatFull.format(value);
                                      }
                                    });
                                  });
                                },
                                controller: dateController,
                                style: GoogleFonts.signika(fontSize: 25),
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    isDense: true,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: buttonColor),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: buttonColor))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                               SizedBox(
                            width: 150,
                            child: Text(
                              'Category',
                              style: GoogleFonts.signika(fontSize: 25),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            child: MediaQuery(
                              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),

                             child: TextField(
                              readOnly: true,
                              enableInteractiveSelection: false,
                              onTap: ()async{
                                var result= await showDialog(
                                  context: context,
                                  builder: (context)=> ShowCategory()
                                );
                                if (result!=null) {
                                  categorySelect=result;
                                  categoryController.text=result;
                                  setState(() {
                                    
                                  });

                                  
                                }
                              },
                              controller: categoryController,
                              style: GoogleFonts.signika(
                                fontSize: 25,
                                color: Colors.black,

                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: buttonColor)
                                ),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: buttonColor)),
                              ),
                             )),
                           
                          )
                        ],

                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Amount',style: GoogleFonts.signika(fontSize: 25),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
