import 'package:cash_book/screens/home/screen_home.dart';
import 'package:cash_book/utils/colors.dart';
import 'package:cash_book/utils/reusable_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double mediaqueryHeight= MediaQuery.of(context).size.height;
     double mediaqueryWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'CashBook',
          style: GoogleFonts.signika(fontSize: mediaqueryWidth*0.08, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height:mediaqueryWidth*0.40,
                  width: double.infinity,
                  child: Image(image: AssetImage('assets/images/logo3.png')),
                ),
                hdivider1,
                hdivider1,
                Text(
                  'Welcome To CashBook  ',
                  style: GoogleFonts.signika(
                    fontSize: mediaqueryWidth*0.081,
                    fontWeight: FontWeight.w700,
                    color: headingColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                // hdivider1,
                Text(
                  ' Please Enter Your Name ',
                  style: GoogleFonts.signika(
                    fontSize: mediaqueryWidth*0.050,
                    fontWeight: FontWeight.w700,
                    color: headingColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                hdivider1,

                TextFormField(
                  validator: (value) {
                    if (value== null|| value.isEmpty) {
                      return "Name can't be empty";
                      
                    }
                    
                  },
                  keyboardType: TextInputType.text,
                  maxLength: 8,
                  maxLines: 1,
                  autofocus: false,
                  controller: nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 237, 214, 248),
                    hintText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                hdivider1,
                ElevatedButton(
                  onPressed: () async{
                    
                    final SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
                    sharedPreferences.setString('name', nameController.text.toString());
                    
                    nameController.text==null || nameController.text.isEmpty
                    ? null
                    :  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));

                   

                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minimumSize: Size(150, 50)),
                ),
                hdivider2,
                hdivider1,

                Text('On Clicking the button you are starting your financial recording with us, we hope you will have a good journey. ',
                style: TextStyle(
                  fontSize: mediaqueryWidth*0.0350,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
