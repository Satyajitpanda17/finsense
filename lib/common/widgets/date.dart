// lib/custom_date_picker.dart
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final double width;

  const CustomDatePicker({
    Key? key,
    required this.selectedDate,
    required this.onDateChanged,
    this.width = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: const Color(0xffC5C5C5)),
      ),
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2020),
            lastDate: DateTime(2100),
          );
          if (newDate == null) return;
          onDateChanged(newDate);
        },
        child: Text(
          'Date : ${selectedDate.year} / ${selectedDate.day} / ${selectedDate.month}',
          style:  TextStyle(fontSize: 15, color: Theme.of(context).textTheme.bodyMedium?.color),
        ),
      ),
    );
  }
}
