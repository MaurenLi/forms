import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class FormD extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Salesians Sarria 24/25'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FormBuilderTextField(
                  name: 'autocomplete',
                  decoration: InputDecoration(
                    labelText: 'Autocomplete',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF1565C0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FormBuilderDateTimePicker(
                  name: 'date_picker',
                  inputType: InputType.date,
                  decoration: InputDecoration(
                    labelText: 'Date Picker',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FormBuilderDateRangePicker(
                    name: 'travel_date',
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    format: DateFormat('MMM dd, yyyy'),
                    decoration: InputDecoration(
                      labelText: 'Travel dates',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _formKey.currentState!.fields['travel_dates']?.didChange(null);
                        },
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FormBuilderDateTimePicker(
                  name: 'time_picker',
                  inputType: InputType.time,
                  decoration: InputDecoration(
                    labelText: 'Time Picker',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),
                    suffixIcon: const Icon(Icons.access_time, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: FormBuilderFilterChip<String>(
                  name: 'filter_chip',
                  alignment: WrapAlignment.spaceEvenly,
                  options: const [
                    FormBuilderChipOption(
                      value: 'HTML',
                    ),
                    FormBuilderChipOption(
                      value: 'CSS',
                    ),
                    FormBuilderChipOption(
                      value: 'React',
                    ),
                    FormBuilderChipOption(
                      value: 'Dart',
                    ),
                    FormBuilderChipOption(
                      value: 'TypeScript',
                    ),
                    FormBuilderChipOption(
                      value: 'Angular',
                    ),
                  ],
                  backgroundColor: Colors.lightBlueAccent,
                  selectedColor: Colors.grey,
                  spacing: 10,
                  runSpacing: 10,
                  padding: const EdgeInsets.all(5),
                  decoration: InputDecoration(
                    labelText: 'Filter Chips',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _formKey.currentState?.save();
          final formData = _formKey.currentState?.value;
          submissionAlertDialog(context, formData.toString());
        },
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.upload),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
void submissionAlertDialog(BuildContext context, String contentText) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text("Submission Completed"),
      icon: const Icon(Icons.check_circle),
      content: Text(contentText),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'close'),
          child: const Text('Close'),
        ),
      ],
    ),
  );
}
