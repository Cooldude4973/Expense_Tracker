import 'package:expense_tracker2/Data%20Models/Expense_model.dart';
import 'package:expense_tracker2/widgets/Expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({required this.myExpenseList, super.key});

  List<Expense> myExpenseList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myExpenseList.length,
        itemBuilder: (context, index) {
          return ExpenseItem(eachExpense: myExpenseList[index]);
        });
  }
}
