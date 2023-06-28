import 'package:expense_tracker2/Data%20Models/Expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewExpense extends StatefulWidget {
  NewExpense({required this.onAddExpense, super.key});

  void Function(Expense expense) onAddExpense;
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selecetedCategory = Category.Gym;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final initialDate = DateTime.now();
    final firstDate =
        DateTime(initialDate.year - 1, initialDate.month, initialDate.day);
    final lastDate = initialDate;
    final datePicked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = datePicked;
    });
  }

  void _onSubmitButtonPressed() {
    final expenseAmount = double.tryParse(_amountController.text);
    final validAmount =
        (expenseAmount == null || expenseAmount <= 0) ? true : false;
    if (_titleController.text.trim().isEmpty ||
        validAmount ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (cxt) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text(
                    'Please make sure a valid title , amount and date is selected'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(cxt);
                      },
                      child: const Text("Okay"))
                ],
              ));
      return;
    }
    widget.onAddExpense(Expense(
        title: _titleController.text,
        amount: expenseAmount,
        category: _selecetedCategory,
        dateTime: _selectedDate!));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      // height: 300,
      // color: Colors.amber,
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(label: Text('Title')),
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$ ',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(_selectedDate == null
                      ? "No selected Date"
                      : formatter.format(_selectedDate!)),
                  IconButton(
                      onPressed: _showDatePicker,
                      icon: const Icon(Icons.calendar_month_outlined))
                ],
              ))
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selecetedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category.name.toString()));
                  }).toList(),
                  onChanged: (values) {
                    setState(() {
                      _selecetedCategory = values!;
                    });
                  }),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: _onSubmitButtonPressed,
                  child: const Text('Submit Expense'))
            ],
          )
        ],
      ),
    );
  }
}
