import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormA extends StatelessWidget {

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {

    final TextEditingController _remarksController = TextEditingController();

    String speed = "";
    String remark = "";
    String highspeed = "";
    String selectSpeed = "";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Salesians Sarria 24/25'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const FormTitle(),
            FormBuilder(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: const Text(
                            'Please provide the speed of vehicle?',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text(
                            'Please select one otion given below',
                            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                        ),
                        FormBuilderRadioGroup(
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            name: "speed",
                            orientation: OptionsOrientation.vertical,
                            options: const [
                              FormBuilderFieldOption(value: "abvoe 40km/h"),
                              FormBuilderFieldOption(value: "below 40km/h"),
                              FormBuilderFieldOption(value: "0km/h"),
                            ],
                            onChanged: (String? value) {
                              debugPrint(value);
                              speed = value ?? '--';
                            },
                        ),
                        const Text(
                          'Enter remarks',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        FormBuilderTextField(
                          name: 'Enter your remarks',
                          controller: _remarksController,
                          decoration: InputDecoration(
                            labelText: 'Enter your remarks',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.all(16.0),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        ListTile(
                          title: const Text(
                            'Please provide the high speed of vehicle?',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text(
                            'Please select one otion given below',
                            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                        ),
                        FormBuilderDropdown(
                          name: 'dropdown',
                          decoration: InputDecoration(
                            labelText: 'Select option',
                            filled: true,
                            fillColor: Colors.grey[200],
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            contentPadding: const EdgeInsets.all(16.0),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          items: const [
                            DropdownMenuItem(value: 'High', child: Text('High')),
                            DropdownMenuItem(value: 'Medium', child: Text('Medium')),
                            DropdownMenuItem(value: 'Low', child: Text('Low')),
                          ],
                          onChanged: (value) {
                            print('Selected value: $value');
                            highspeed = value ?? '--';
                          },
                        ),
                        ListTile(
                          title: const Text(
                            'Please provide the speed of vehicle past 1 hour?',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text(
                            'please provide the speed of vehicle past 1 hour',
                            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                          ),
                        ),
                        FormBuilderCheckboxGroup(
                            name: 'checkbox_group',
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(top: 10.0),
                              border: InputBorder.none,
                            ),
                            options: const [
                              FormBuilderFieldOption(value: '20km/h', child: Text('20km/h')),
                              FormBuilderFieldOption(value: '30km/h', child: Text('30km/h')),
                              FormBuilderFieldOption(value: '40km/h', child: Text('40km/h')),
                              FormBuilderFieldOption(value: '50km/h', child: Text('50km/h')),
                            ],
                            orientation: OptionsOrientation.vertical,
                            onChanged: (valueList) {
                              if (valueList != null && valueList.length > 1) {
                                valueList.removeAt(0);
                              }
                            },
                        ),
                      ],
                    ),
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            remark = _remarksController.text;
            submissionAlertDialog(context, "Speed: " + speed + " Remark: " + remark + " Highspeed: " + highspeed + " Select Speed: " + selectSpeed);
          },
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.upload),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class FormTitle extends StatelessWidget {
  const FormTitle({
    super.key
  });
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Mauro Form',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text('Form A',
              style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
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
      )
  );
}