import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String name;
  final String explain;
  final String time;
  final String amount;
  final String type;

  const TransactionTile({
    super.key,
    required this.name,
    required this.explain,
    required this.time,
    required this.amount,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset("assets/images/$name.png"),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        time,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Text(
        '\$ $amount',
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w500,
          color: type == 'Expense' ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}
