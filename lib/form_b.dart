import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormB extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final ValueNotifier<int> _currentStep = ValueNotifier<int>(0);

  final TextEditingController _Email = TextEditingController();
  final TextEditingController _Address = TextEditingController();
  final TextEditingController _Mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Salesians Sarria 24/25'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: FormBuilder(
        key: _formKey,
        child: ValueListenableBuilder<int>(
          valueListenable: _currentStep,
          builder: (context, currentStep, _) {
            return Stepper(
              type: StepperType.horizontal,
              currentStep: currentStep,
              onStepContinue: () {
                if (_currentStep.value < 2) {
                  _currentStep.value += 1;
                }
              },
              onStepCancel: currentStep > 0
                  ? () => _currentStep.value -= 1
                  : null,
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return _buildNavigationButtons(context, currentStep);
              },
              steps: <Step>[
                Step(
                  title: const Text('Pers.'),
                  isActive: currentStep >= 0,
                  state: currentStep == 0
                      ? StepState.editing
                      : StepState.complete,
                  content: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Pulsi "Contact" o pulsi el botó de "Continue".'),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                Step(
                  title: const Text('Contact'),
                  isActive: currentStep >= 1,
                  state: currentStep == 1
                      ? StepState.editing
                      : StepState.complete,
                  content: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Pulsi "Upload" o pulsi el botó de "Continue".'),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                Step(
                  title: const Text('Upload'),
                  isActive: currentStep >= 2,
                  state: currentStep == 2
                      ? StepState.editing
                      : StepState.complete,
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderTextField(
                        name: 'email',
                        controller: _Email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email, color: Colors.lightBlueAccent),
                          hintStyle: const TextStyle(color: Colors.lightBlueAccent),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.lightBlueAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Color(0xFF1565C0)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormBuilderTextField(
                        name: 'address',
                        controller: _Address,
                        decoration: InputDecoration(
                          hintText: 'Address',
                          prefixIcon: const Icon(Icons.home, color: Colors.lightBlueAccent),
                          hintStyle: const TextStyle(color: Colors.lightBlueAccent),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.lightBlueAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                        ),
                        maxLines: null,
                        minLines: 4,
                      ),
                      const SizedBox(height: 8),
                      FormBuilderTextField(
                        name: 'mobile',
                        controller: _Mobile,
                        decoration: InputDecoration(
                          hintText: 'Mobile No',
                          prefixIcon: const Icon(Icons.phone, color: Colors.lightBlueAccent),
                          hintStyle: const TextStyle(color: Colors.lightBlueAccent),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.lightBlueAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Color(0xFF1565C0)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavigationButtons(BuildContext context, int currentStep) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: currentStep < 2
              ? () => _currentStep.value += 1
              : () => _submissionAlertDialog(context, "Email: ${_Email.text} Address: ${_Address.text} Mobile: ${_Mobile.text}"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.white,
          ),
          child: const Text('CONTINUE'),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: currentStep > 0
              ? () => _currentStep.value -= 1
              : null,
          style: TextButton.styleFrom(
            foregroundColor: Colors.lightBlueAccent,
          ),
          child: const Text('CANCEL'),
        ),
      ],
    );
  }

  void _submissionAlertDialog(BuildContext context, String contentText) {
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
}