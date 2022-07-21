import 'package:cash_book/main.dart';
import 'package:cash_book/models/model_class.dart';
import 'package:cash_book/screens/home/screensinhome/screen_categories.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddCategory extends StatelessWidget {
  final addCategoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double mediaqueryHeight= MediaQuery.of(context).size.height;
    double mediaqueryWidth= MediaQuery.of(context).size.width;
    SizedBox hdivider1= SizedBox(height: mediaqueryHeight*0.0155,);
SizedBox hdivider2= SizedBox(height: mediaqueryHeight*0.02325,);
    return AlertDialog(
      content: SizedBox(
        height:  mediaqueryWidth*0.5,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Add Category',
              style: GoogleFonts.signika(
                  fontSize: mediaqueryWidth*0.07,
                  color: headingColor,
                  fontWeight: FontWeight.w600),
            ),
            TextField(
              inputFormatters: [
                LengthLimitingTextInputFormatter(15)
              ],
              style: GoogleFonts.signika(fontSize: mediaqueryWidth*0.057),
              controller: addCategoryController,
              cursorColor: buttonColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                isDense: true,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: buttonColor),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (RegExp(r'^.*[a-zA-Z0-9]+.*$')
                    .hasMatch(addCategoryController.text)) {
                  if (!checkDuplicate(addCategoryController.text)) {
                    categoryVariable.add(Category(addCategoryController.text,
                        indexController == 0 ? true : false));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        elevation: 10,
                        // behavior: SnackBarBehaviour.fixed,
                        backgroundColor: expenseColor,
                        content: Text(
                          'Category Name Exists',
                          style: GoogleFonts.signika(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        )));
                  }
                }

                Navigator.pop(context);
              },
              child: Text(
                'Save',
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
                  minimumSize: Size(150, 50)),
            )
          ],
        ),
      ),
    );
  }
}

bool checkDuplicate(String text) {
  List<Category> list = categoryVariable.values.toList();
  bool duplicate = false;
  for (int i = 0; i < list.length; i++) {
    if (list[i].categoryName.trim() == text.trim()) {
      duplicate = true;
    }
  }
  return duplicate;
}
