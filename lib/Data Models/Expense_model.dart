import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Category { Food, Gym, Travel, Leisure, Others }

final formatter = DateFormat.yMd();

final categoryIcons = {
  Category.Food: const Icon(Icons.lunch_dining),
  Category.Gym: const Icon(Icons.sports_gymnastics),
  Category.Travel: const Icon(Icons.flight_takeoff),
  Category.Leisure: const Icon(Icons.movie_creation),
  Category.Others: const Icon(Icons.airline_seat_individual_suite_outlined)
};

class Expense {
  Expense(
      {required this.amount,
      required this.category,
      required this.dateTime,
      required this.title});
  double amount;
  String title;
  DateTime dateTime;
  Category category;

  String formattedTime() {
    return formatter.format(dateTime);
  }
}
