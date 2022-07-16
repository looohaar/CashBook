

import 'package:cash_book/main.dart';
import 'package:cash_book/models/model_class.dart';
import 'package:cash_book/screens/home/subscreens/addCategory.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class EditCategory extends StatefulWidget {
final  bool transactionType;
final int indexKey;
EditCategory({required this.indexKey,required this.transactionType});
  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {

  final categoryEditController= TextEditingController();
  @override
  void initState(){
    categoryEditController.text=categoryVariable.get(widget.indexKey)!.categoryName.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Edit Category',
      style: GoogleFonts.signika(color: buttonColor,
      fontSize: 30
      ),
      textAlign: TextAlign.center,

      
      ),
      hdivider2,
      hdivider1,
      TextField(
      
        style: GoogleFonts.signika(fontSize: 20),
        
        controller: categoryEditController,
        cursorColor: Colors.purple,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:EdgeInsets.all(5) ,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: buttonColor),

          ),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: buttonColor)),
        ),

      ),
      hdivider2,
      hdivider2,
      ElevatedButton(
        
        onPressed: (){
          if(RegExp(r'^.*[a-zA-Z0-9]+.*$').hasMatch(categoryEditController.text)){
            if(!checkDuplicate(categoryEditController.text)){
              addNewCategory(categoryEditController.text);
              categoryVariable.put(widget.indexKey, 
              Category(categoryEditController.text, widget.transactionType)
              );
            }else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Category Exists',
              style: GoogleFonts.signika(
                fontSize: 20,
                color: Colors.white
              ),
              textAlign: TextAlign.center,

              ),
              backgroundColor: expenseColor,
              ));
            }
          }
   Navigator.pop(context);


        },

         child: Text('Save',
         style: GoogleFonts.signika(
          fontSize:25,
          color: Colors.white,
          fontWeight: FontWeight.w700,
         ),),
         style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
                 minimumSize: Size(150, 50)
         ),
         )
        ],
      ),
      



      
 

      
    );
  }
 
void addNewCategory(String newName){
 String name= categoryVariable.get(widget.indexKey)!.categoryName;
 List<Transactions> list= transactionsVariable.values.toList();
 for (int i = 0; i < list.length; i++) {
  if (list[i].categories==name) {
    transactionsVariable.put(

      // key
      list[i].key,
      // value
      Transactions(list[i].amount,
       list[i].transactionType,
        list[i].date,
         newName, 
         list[i].notes)
      );
    
  }
   
 }
}

}
