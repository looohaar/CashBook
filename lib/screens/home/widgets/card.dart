import 'package:cash_book/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Card extends StatefulWidget {
//  final double totalBalance;
//  final double income;
//  final double expense;

//  Card({
//   required this.expense,
//   required this.income,
//   required this.totalBalance
//  });



  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return 
      Container(
        padding: EdgeInsets.all(30),
        
        height: 200,
        width: double.infinity,
    
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30),
          
          
          gradient: LinearGradient(
            colors: [
              buttonColor,
              Colors.white,
            ],
            
    
          
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
            
            )
         
    
        ),
        child: Stack(
          
          children: [
            
          ],
        ),
        
        
    
      );

      
    
    
  }
}