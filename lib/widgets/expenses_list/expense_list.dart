import 'package:expenses/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemoveexpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveexpense;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            color: Theme.of(context).colorScheme.error.withOpacity(0.75),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
            ),
          ),
          onDismissed: (direction) {
            onRemoveexpense(expenses[index]);
          },
          child: ExpenseItem(expenses[index])),
    );
  }
}
