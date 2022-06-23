import 'dart:ui';

import 'package:cash_book/utils/colors.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
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
                          'Rs. 1000000',
                          style: GoogleFonts.signika(
                            fontSize: 25,
                            color: Colors.white,
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
                                  'Rs. 1000000',
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
                                  'Rs. 1000000',
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
                ),
              hdivider1,
              Container(
                child: Text('All Transactions',style: GoogleFonts.signika(
                  fontSize: 25,
                  color: headingColor,
                  fontWeight: FontWeight.w500
                ),),
              ),
            ],
            
          ),
          ),
       )
      );
    
  }
}