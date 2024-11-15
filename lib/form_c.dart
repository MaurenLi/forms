import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormC extends StatelessWidget {
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
        padding: const EdgeInsets.all(8.0),
        child: FormBuilder(
          key: _formKey,
          child: Wrap(
            runSpacing: 4.0,
            spacing: 4.0,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FormBuilderChoiceChip<String>(
                  name: 'choice_chip',
                  alignment: WrapAlignment.spaceEvenly,
                  options: const [
                    FormBuilderChipOption(
                      value: 'Flutter',
                      avatar: Icon(Icons.flutter_dash),
                    ),
                    FormBuilderChipOption(
                      value: 'Android',
                      avatar: Icon(Icons.android),
                    ),
                    FormBuilderChipOption(
                      value: 'Chrome OS',
                      avatar: Icon(Icons.laptop_chromebook),
                    ),
                  ],
                  selectedColor: Colors.grey,
                  backgroundColor: Colors.lightBlueAccent,
                  spacing: 10,
                  runSpacing: 10,
                  padding: const EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Choice Chips',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FormBuilderSwitch(
                  name: 'switch',
                  title: const Text('This is a switch'),
                  decoration: InputDecoration(
                    labelText: 'Switch',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: FormBuilderTextField(
                  name: 'text_field',
                  decoration: InputDecoration(
                      labelText: 'Text Field',
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
              padding: const EdgeInsets.all(5.0),
              child: FormBuilderDropdown<String>(
                  name: 'dropdown',
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFF1565C0)),
                    ),
                  ),
                  initialValue: null,
                  hint: const Text('Dropdown Field'),
                  items: ['Finland', 'Spain', 'United Kingdom']
                      .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
                      .toList(),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: FormBuilderRadioGroup<String>(
                  name: 'radio_group',
                  options: const [
                    FormBuilderFieldOption(value: 'Option 1', child: Text('Option 1')),
                    FormBuilderFieldOption(value: 'Option 2', child: Text('Option 2')),
                    FormBuilderFieldOption(value: 'Option 3', child: Text('Option 3')),
                    FormBuilderFieldOption(value: 'Option 4', child: Text('Option 4')),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Radio Group Model',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),
                  ),
                  orientation: OptionsOrientation.vertical,
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