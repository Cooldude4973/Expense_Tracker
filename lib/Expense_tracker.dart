import 'package:expense_tracker2/Data%20Models/Expense_model.dart';
import 'package:expense_tracker2/widgets/Expense_list.dart';
import 'package:expense_tracker2/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});
  @override
  State<ExpenseTracker> createState() {
    return _ExpenseTrackerState();
  }
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Expense> _registeredExpenses = [
    (Expense(
        amount: 80,
        category: Category.Food,
        dateTime: DateTime.now(),
        title: "Shawrama")),
    (Expense(
        amount: 200,
        category: Category.Travel,
        dateTime: DateTime.now(),
        title: "Petrol"))
  ];

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _showNewExpense() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (cxt) {
          return NewExpense(
            onAddExpense: addExpense,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker '),
        actions: [
          IconButton(onPressed: _showNewExpense, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("This is My Chart"),
          // Text('This is my List of Expenses')
          Expanded(
            child: ExpensesList(
              myExpenseList: _registeredExpenses,
            ),
          )
        ],
      ),
    );
  }
}
