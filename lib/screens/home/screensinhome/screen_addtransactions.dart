import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddTransactions extends StatefulWidget {
  const AddTransactions({Key? key}) : super(key: key);

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Add Transactions')),
    );
    
  }
}