import 'package:expense_tracker2/Data%20Models/Expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem({required this.eachExpense, super.key});

  Expense eachExpense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eachExpense.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(children: [
              Text(eachExpense.amount.toStringAsFixed(1)),
              const Spacer(),
              categoryIcons[eachExpense.category]!,
              const SizedBox(
                width: 6,
              ),
              Text(eachExpense.formattedTime())
            ])
          ],
        ),
      ),
    );
  }
}
