import 'package:cash_book/main.dart';
import 'package:cash_book/models/model_class.dart';
import 'package:cash_book/screens/home/screensinhome/screen_categories.dart';
import 'package:cash_book/screens/home/subscreens/showCategory.dart';
import 'package:cash_book/utils/dateformats.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../utils/colors.dart';

class EditTransaction extends StatefulWidget {
  final Transactions editTransactiionKey;
  EditTransaction({required this.editTransactiionKey});

//   final bool transactionType;
//   final DateTime date;
//   final String categories;
//   final double amount;
//  List<Transactions>? receivingList;
// EditTransaction(
//   {
//     required this.amount,
//     required this.categories,
//     required this.date,
//     required this.transactionType
//   }
// );

// final amountController= TextEditingController();
// final dateController= TextEditingController();
// final categoriesControler= TextEditingController();
// final transactionController=TextEditingController();

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  DateTime? initialDate;
  String? selectCategory;
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final categoriesController = TextEditingController();
  final notesController = TextEditingController();
  bool? transactionType;

  @override
  void initState() {
    selectCategory = widget.editTransactiionKey.categories;
    notesController.text = widget.editTransactiionKey.notes;
    initialDate = widget.editTransactiionKey.date;
    amountController.text = widget.editTransactiionKey.amount.toString();
    dateController.text =
    dateformatFull.format(widget.editTransactiionKey.date);
    categoriesController.text = widget.editTransactiionKey.categories;
    transactionType = widget.editTransactiionKey.transactionType;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: transactionType!
              ? Text(
                  'Income',
                  style: GoogleFonts.signika(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                )
              : Text(
                  'Expense',
                  style: GoogleFonts.signika(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date',
                          style: GoogleFonts.signika(fontSize: 30),
                        ),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            readOnly: true,
                            enableInteractiveSelection: false,
                            controller: dateController,
                            style: GoogleFonts.signika(fontSize: 25),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5),
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: buttonColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: buttonColor),
                              ),
                            ),
                            onTap: () {
                              showDatePicker(
                                builder: (context, child) {
                                  return MediaQuery(
                                    data: MediaQuery.of(context)
                                        .copyWith(textScaleFactor: 1),
                                    child: Theme(
                                        data: ThemeData(
                                            colorScheme: ColorScheme.light(
                                                primary: buttonColor)),
                                        child: child!),
                                  );
                                },
                                context: context,
                                firstDate: DateTime(DateTime.now().year - 10),
                                initialDate: initialDate!,
                                lastDate: DateTime.now(),
                              ).then((value) {
                                setState(() {
                                  if (value != null) {
                                    initialDate = value;
                                    dateController.text =
                                        dateformatFull.format(value);
                                  }
                                });
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Category',
                            style: GoogleFonts.signika(fontSize: 30)),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            readOnly: true,
                            enableInteractiveSelection: false,
                            controller: categoriesController,
                            style: GoogleFonts.signika(fontSize: 25),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: buttonColor)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: buttonColor)),
                            ),
                            onTap: () async {
                              indexController =
                                  widget.editTransactiionKey.transactionType ==
                                          true
                                      ? 0
                                      : 1;
                              var result = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ShowCategory();
                                  });
                              if (result != null) {
                                // selectCategory != result;
                                // categoriesController.text = result;

                                setState(() {
                                   selectCategory = result;
                                categoriesController.text = result;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Amount',
                            style: GoogleFonts.signika(
                              fontSize: 30,
                            )),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                RegExp(r"[\s,-]"),
                              ),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r"^(?:0|[1-9]\d+|)?(?:.?\d*)?$"))
                            ],
                            cursorColor: buttonColor,
                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.signika(fontSize: 25),
                            controller: amountController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: buttonColor)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: buttonColor)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Notes',
                            style: GoogleFonts.signika(
                              fontSize: 30,
                            )),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            controller: notesController,
                            cursorColor: buttonColor,
                            enableInteractiveSelection: false,
                            keyboardType: TextInputType.text,
                            style: GoogleFonts.signika(fontSize: 25),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: buttonColor)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: buttonColor)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    hdivider2,
                    hdivider2,
                    hdivider2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (amountController.text.isEmpty ||
                                amountController.text == null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                  'Enter Transaction Details',
                                  style: GoogleFonts.signika(
                                      fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: expenseColor,
                              ));
                            } else if (initialDate ==
                                widget.editTransactiionKey.date) {
                              transactionsVariable.put(
                                  widget.editTransactiionKey.key,
                                  Transactions(
                                    double.parse(amountController.text),
                                    widget.editTransactiionKey.transactionType,
                                    widget.editTransactiionKey.date,
                                    selectCategory!,
                                    notesController.text,
                                  ));
                              Navigator.pop(context);
                            } else {
                              transactionsVariable.delete(widget.editTransactiionKey.key);
                              transactionsVariable.put(
                                  1231246060 -
                                      (int.parse(
                                          dateformatKey.format(initialDate!) +
                                              dateformatter
                                                  .format(DateTime.now()))),
                                  Transactions(
                                      double.parse(amountController.text),
                                      widget
                                          .editTransactiionKey.transactionType,
                                      initialDate!,
                                      selectCategory!,
                                      notesController.text));
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'Update',
                            style: GoogleFonts.signika(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: Size(150, 50),
                          ),
                        ),
                      ],
                    ),

                    // *********************DELETE BUTTON CODE**********************
                    // ElevatedButton(

                    //   onPressed: (){
                    //     showDialog(context: context,
                    //     builder: (context){
                    //       return AlertDialog(
                    //         title: Text(
                    //          ' Delete Transaction',
                    //           style: GoogleFonts.signika(
                    //                             fontSize: 30, color: buttonColor),
                    //                         textAlign: TextAlign.center,

                    //         ),
                    //         content: Text(
                    //           'Are You Sure You Want To Delete ?',
                    //                         style: GoogleFonts.signika(
                    //                             fontSize: 20,
                    //                             color: Colors.black),
                    //                         textAlign: TextAlign.center,
                    //         ),
                    //         actions: [
                    //           TextButton(onPressed: (){
                    //              transactionsVariable.delete(widget.editTransactiionKey.key);
                    //             Navigator.pop(context);
                    //             Navigator.pop(context);
                    //             // Navigator.push(context, MaterialPageRoute(builder: (context)=>Transactions(amount, transactionType, date, categories, notes)))
                    //           },
                    //            child: Text('Yes',
                    //                                 style: GoogleFonts.signika(
                    //                                   fontSize: 20,
                    //                                   color: Colors.black,
                    //                                 ))
                    //            ),

                    //            TextButton(
                    //                             onPressed: () {
                    //                               Navigator.pop(context);
                    //                             },
                    //                             child: Text('No',
                    //                                 style: GoogleFonts.signika(
                    //                                   fontSize: 20,
                    //                                   color: Colors.black,
                    //                                 )))

                    //         ],
                    //       );
                    //     }

                    //     );

                    //   },

                    //   child: Text(
                    //     'Delete',
                    //     style: GoogleFonts.signika(
                    //         color: Colors.white,
                    //         fontSize: 25,
                    //         fontWeight: FontWeight.w700),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //     primary: buttonColor,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     minimumSize: Size(150, 50),
                    //   ),

                    // ),
                  ],
                ))));
  }
}
