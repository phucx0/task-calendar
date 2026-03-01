import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final Function(DateTime) onSelected;

  const DatePickerField({super.key, required this.onSelected});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? selected;

  Future pickDate() async {
    DateTime now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() => selected = date);
      widget.onSelected(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: pickDate,
      child: Text(
        selected == null
            ? "Chọn ngày"
            : "${selected!.day}/${selected!.month}/${selected!.year}",
      ),
    );
  }
}