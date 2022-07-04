import 'package:cash_book/main.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/model_class.dart';

class DeleteCategory extends StatelessWidget {
 final int? categoryKey;
 final int? transactionKey;
 
  // var transactonKey;
 
DeleteCategory(this.categoryKey, this.transactionKey);

 
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Category',
      style: GoogleFonts.signika(
        fontSize: 30,
        color: buttonColor,

      ),
      textAlign: TextAlign.center,),
      content: Text('Are You Sure You Want To Delete ?',
      style: GoogleFonts.signika(
        fontSize: 20
      ),
       textAlign: TextAlign.center),
      actions: [
        TextButton(onPressed: (){
          
        if (checkTransaction(categoryKey!)==true) {
          categoryVariable.delete(categoryKey);
          Navigator.pop(context);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Transactions With This Category Exists',
              style: GoogleFonts.signika(
               color: Colors.white,
               fontSize: 20
              ),
              textAlign: TextAlign.center,),
              backgroundColor: expenseColor,

            ));
             Navigator.pop(context);
        }
          


        }, 
        child: Text('Yes',
         style: GoogleFonts.signika(fontSize: 20),)),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, 
        child: Text('No',
        style: GoogleFonts.signika(fontSize: 20),))

      ],
    );
    
    
  }

  bool checkTransaction(int key){

    String name= categoryVariable.get(key)!.categoryName;
    List<Transactions> list= 
    transactionsVariable.values.where((element) => element.categories.contains(name)).toList();
    
    return list.isEmpty? true : false;

   
  }
}