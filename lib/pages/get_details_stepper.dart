import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q4u_final/widgets/segmented_controller.dart';

class GetDetailsStepper extends StatefulWidget {
  GetDetailsStepper({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _GetDetailsStepperState createState() => _GetDetailsStepperState();
}

class _GetDetailsStepperState extends State<GetDetailsStepper> {
  List<Step> steps = [
    Step(
      title: const Text('New Account'),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Email Address'),
            // controller: emailController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Address'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Street Address'),
            // controller: streetAddressController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Suburb'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'City/Town'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Postcode'),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('ID'),
      content: Column(
        children: <Widget>[
          Text("Type Of ID"),
          CupertinoSegmentedControlDemo(),
          TextFormField(
            decoration: InputDecoration(labelText: 'ID Number'),
            // controller: streetAddressController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Surname'),
          ),
          Text("Gender"),
          //Male or Female
          CupertinoSegmentedControlDemo(),
        ],
      ),
    ),
  ];

  StepperType stepperType = StepperType.horizontal;
  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  switchStepType() {
    setState(() => stepperType == StepperType.horizontal
        ? stepperType = StepperType.vertical
        : stepperType = StepperType.horizontal);
  }

  @override
  Widget build(BuildContext context) {
    var _onPressed;

    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Details"),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: Stepper(
            steps: steps,
            type: stepperType,
            currentStep: currentStep,
            onStepContinue: next,
            onStepCancel: cancel,
            onStepTapped: (step) => goTo(step),
          ),
        ),
      ]),
    );
  }
}
