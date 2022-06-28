import 'package:cash_book/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


SizedBox hdivider1= SizedBox(height: 10,);
SizedBox hdivider2= SizedBox(height: 15,);
SizedBox wdivider1= SizedBox(width: 10,);
SizedBox wdivider2= SizedBox(width: 15,);

// custom transaction card

class CustomTransactionCard extends StatelessWidget {
 String date;
 String category;
 String amount;
 Color color;
 CustomTransactionCard({required this.amount,required this.category,required this.color,required this.date});

  @override
  Widget build(BuildContext context) {
    return SizedBox( 
      height: MediaQuery.of(context).size.height*0.1,
      width: double.maxFinite,
      
      child: Card(
        child: Center(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: MediaQuery.of(context).size.height*0.7,
                width: MediaQuery.of(context).size.width*0.32,
                color: color,
                child: Center(
                  child: Text(date,
                  style: GoogleFonts.signika(fontSize: 12,color: Colors.white)
                  ),
                ),

              ),
              
            ),
            title: Text(category),
            trailing: Text(amount,
            style: TextStyle(color: color),),
          ),

        ),
      ),
    );
    
  }
}
