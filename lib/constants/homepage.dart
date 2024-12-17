import 'package:flutter/material.dart';
import 'package:pennysmart/widgets/expenses_view.dart';
import 'package:pennysmart/widgets/income_view.dart';

class Homepage {
  static Map<String, Widget> pages = {
    "Income": const IncomeView(),
    "Expenses": const ExpensesView(),
  };
}
