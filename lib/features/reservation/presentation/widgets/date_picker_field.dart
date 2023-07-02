import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key, required this.onDateSelected});
  final void Function(DateTime) onDateSelected;
  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  final TextEditingController _dateController = TextEditingController();
  DateFormat format = DateFormat.yMd('es');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      decoration: const InputDecoration(
          labelText: 'Fecha',
          filled: true,
          prefixIcon: Icon(Icons.calendar_today),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      readOnly: true,
      onTap: () => _selectDate(context),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 16)));

    if (picked != null) {
      setState(() {
        _dateController.text = format.format(picked);
      });

      widget.onDateSelected(picked);
    }
  }
}
