import 'package:cash_book/main.dart';
import 'package:cash_book/models/model_class.dart';
import 'package:cash_book/utils/dateformats.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';

 
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


final amountController= TextEditingController();
final dateController= TextEditingController();
final categoriesController= TextEditingController();

 bool? transactionType;

@override
void initState(){
amountController.text= widget.editTransactiionKey.amount.toString();
dateController.text= dateformatFull.format(widget.editTransactiionKey.date);
categoriesController.text=widget.editTransactiionKey.categories;
transactionType = widget.editTransactiionKey.transactionType;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
    );
    
  }
}