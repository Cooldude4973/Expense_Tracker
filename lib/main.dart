import 'package:expense_tracker2/Expense_tracker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: ExpenseTracker(),
  ));
}
