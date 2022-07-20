

import 'package:cash_book/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// SizedBox hdivider1= SizedBox(height: 10,);
// SizedBox hdivider2= SizedBox(height: 15,);
// SizedBox wdivider1= SizedBox(width: 10,);
// SizedBox wdivider2= SizedBox(width: 15,);
// double mediaqueryHeight= MediaQuery.of(context).size.height;


// Container(
//                     height: 220,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black54, width: 3),
//                         gradient: LinearGradient(
//                           colors: [
//                             buttonColor,
//                             Color.fromARGB(214, 235, 224, 128),
//                             // Color.fromARGB(255, 156, 104, 228),
//                             buttonColor
//                           ],
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(20))),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Column(
//                         // ******************************TotalBalance**********************************
//                         children: [
//                           Text(
//                             'Total Balance',
//                             style: GoogleFonts.signika(
//                                 fontSize: 30,
//                                 color: Color.fromARGB(255, 50, 3, 3),
//                                 fontWeight: FontWeight.w700),
//                             textAlign: TextAlign.center,
//                           ),
//                           hdivider1,
//                           Expanded(
//                             child: Text(
//                               '₹ ${totalIncome - totalExpense}',
//                               style: GoogleFonts.signika(
//                                 fontSize: 30,
//                                 color: totalIncome - totalExpense < 0
//                                     ? expenseColor
//                                     : incomeColor,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           hdivider2,
//                           // ***********************************************Income***************************************
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 children: [
//                                   Text(
//                                     'Income',
//                                     style: GoogleFonts.signika(
//                                       fontSize: 30,
//                                       color: Color.fromARGB(255, 59, 2, 2),
//                                     ),
//                                   ),
//                                   hdivider1,
//                                   Text(
//                                     '₹ $totalIncome',
//                                     style: GoogleFonts.signika(
//                                       fontSize: 25,
//                                       color: incomeColor,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ],
//                               ),

//                               // ****************************Expense*****************************************************************************
//                               Column(
//                                 children: [
//                                   Text(
//                                     'Expense',
//                                     style: GoogleFonts.signika(
//                                       fontSize: 30,
//                                       color: Color.fromARGB(255, 59, 2, 2),
//                                     ),
//                                   ),
//                                   hdivider1,
//                                   Text(
//                                     '₹ $totalExpense',
//                                     style: GoogleFonts.signika(
//                                       fontSize: 25,
//                                       color: expenseColor,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
class Dividers extends StatefulWidget {
  const Dividers({Key? key}) : super(key: key);

  @override
  State<Dividers> createState() => _DividersState();
}

class _DividersState extends State<Dividers> {
  @override
  Widget build(BuildContext context) {
     double mediaqueryHeight= MediaQuery.of(context).size.height;
    double mediaqueryWidth= MediaQuery.of(context).size.width;
    return Container();
    
  }
}