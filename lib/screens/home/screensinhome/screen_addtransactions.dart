import 'dart:ffi';

import 'package:cash_book/screens/home/screensinhome/screen_categories.dart';
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
                });
              });

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
            })
          ],
        ),
      )),
    );
  }
}
