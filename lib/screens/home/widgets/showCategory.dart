import 'package:cash_book/main.dart';
import 'package:cash_book/models/model_class.dart';
import 'package:cash_book/screens/home/screensinhome/screen_categories.dart';
import 'package:cash_book/screens/home/widgets/addCategory.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShowCategory extends StatelessWidget {
  const ShowCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AlertDialog(
          contentPadding: EdgeInsets.only(top: 5),
          content: SizedBox(
            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height*0.4,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'CATEGORY',
                      style: GoogleFonts.signika(
                        fontSize: 20,
                        color: buttonColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AddCategory());
                          },
                          icon: Icon(
                            Icons.add,
                            color: buttonColor,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: buttonColor,
                            size: 30,
                          ))
                    ],
                  ),
                  
                ],
              ),
              SizedBox(
                child: Container(
                  height: 1,
                  color: buttonColor,
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: categoryVariable.listenable(),
                   builder: (BuildContext context, Box<Category> newbox,Widget? child){
                  List<Category> incomeList= checkIncome(newbox);
                  List<Category> expenseList=checkExpense(newbox);
                  return ListView.builder(
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).pop(indexController==0
                          ?incomeList[index].categoryName
                          :expenseList[index].categoryName
                          );
                        },
                        
                        child: Column(
                          children: [
                            SizedBox(
                              height: 35,
                          
                              child: Center(
                                child: Text(
                                  indexController==0
                                  ?incomeList[index].categoryName
                                  :expenseList[index].categoryName
                                ,style: GoogleFonts.signika(fontSize: 25,),),
                              ),
                        
                            ),
                            SizedBox(
                              child: Container(
                                height: 1,
                                color: Color.fromARGB(255, 209, 205, 205),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: indexController==0
                    ?incomeList.length
                    :expenseList.length,
                    ) ;
                  
                   })
                )
            ]
           ),
          ),
        ),
      ],
    );
  }
}
