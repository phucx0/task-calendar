import 'package:flutter/material.dart';

class DatePickerField extends StatefulWidget {
  final Function(DateTime) onSelected;

  const DatePickerField({super.key, required this.onSelected});

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? selected;

  Future pickDateTime() async {
    DateTime now = DateTime.now();

    /// chọn ngày
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date == null) return;

    /// chọn giờ
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) return;

    /// ghép ngày + giờ
    final result = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    setState(() => selected = result);
    widget.onSelected(result);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: pickDateTime,
      child: Text(
        selected == null
            ? "Chọn ngày giờ"
            : "${selected!.day}/${selected!.month}/${selected!.year}  "
              "${selected!.hour.toString().padLeft(2, '0')}:"
              "${selected!.minute.toString().padLeft(2, '0')}",
      ),
    );
  }
}