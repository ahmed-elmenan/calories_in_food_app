import 'package:fapp/core/styles/GlobalTheme.dart';
import 'package:fapp/core/widgets/shareButton.dart';
import 'package:fapp/features/home/presentation/data/models/boxes.dart';
import 'package:fapp/features/home/presentation/data/models/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

import 'home_page.dart';

class quetionPage extends StatefulWidget {
  @override
  _quetionPageState createState() => _quetionPageState();
}

class _quetionPageState extends State<quetionPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  int gender = -1;
  int _state = -1;
  int _checkTime = -1;
  TextStyle _errorText =
      TextStyle(color: Colors.red, fontSize: 23, fontWeight: FontWeight.bold);
  String _message = "";
  TimeOfDay timeofnow = TimeOfDay.now();
  Firstpage question = new Firstpage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            ShareButton(),
          ],
          title: Center(
            child: Text('Food Calories Calculator',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "greycliff-cf-regular")),
          ),
          backgroundColor: GlobalTheme.lightOrange,
        ),
        body: Container(
          child: Column(
            children: [
              Text(_message, style: _errorText),
              Expanded(
                child: Theme(
                  data: GlobalTheme.widgetThemeData,
                  child: Stepper(
                    type: stepperType,
                    physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: continued,
                    onStepCancel: cancel,
                    steps: <Step>[
                      Step(
                        title: new Text('Gender'),
                        content: Row(
                          children: <Widget>[
                            Text("Male"),
                            Radio(
                              value: 1,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                  question.Gender = value;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text("Female"),
                            Radio(
                              value: 2,
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                  question.Gender = value;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('Address'),
                        content: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              onChanged: (String value) {
                                question.Age = double.parse(value);
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]+')),
                                LengthLimitingTextInputFormatter(2),
                              ],
                              decoration: InputDecoration(labelText: 'Age'),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              onChanged: (String value) {
                                LengthOnSubmitted(value, "Length");
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]+')),
                                LengthLimitingTextInputFormatter(5),
                              ],
                              decoration:
                                  InputDecoration(labelText: 'Length (CM)'),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              onChanged: (String value) {
                                WeightOnSubmitted(value, "Weight");
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]+')),
                                LengthLimitingTextInputFormatter(5),
                              ],
                              decoration:
                                  InputDecoration(labelText: 'Weight (KG)'),
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('Mobile Number'),
                        content: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _state,
                                  onChanged: (value) {
                                    setState(() {
                                      _state = value;
                                      question.typeExercise = value;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                                Text("bla bla bla bla bla bla"),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _state,
                                  onChanged: (value) {
                                    setState(() {
                                      _state = value;
                                      question.typeExercise = value;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                                Text("bla bla bla bla bla bla"),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _state,
                                  onChanged: (value) {
                                    setState(() {
                                      _state = value;
                                      question.typeExercise = value;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                                Text("bla bla bla bla bla bla"),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 4,
                                  groupValue: _state,
                                  onChanged: (value) {
                                    setState(() {
                                      _state = value;
                                      question.typeExercise = value;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                                Text("bla bla bla bla bla bla"),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 5,
                                  groupValue: _state,
                                  onChanged: (value) {
                                    setState(() {
                                      _state = value;
                                      question.typeExercise = value;
                                    });
                                  },
                                  activeColor: Colors.green,
                                ),
                                Text("bla bla bla bla bla bla"),
                              ],
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('Gender'),
                        content: Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                _selectTime(context);
                              },
                              child: Text("Choose Time"),
                            ),
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 3
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay timeOfDay = await showTimePicker(
        context: context,
        initialTime: timeofnow,
        initialEntryMode: TimePickerEntryMode.dial,
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: GlobalTheme.widgetThemeData,
            child: child,
          );
        });
    if (timeOfDay != null) {
      setState(() {
        timeofnow = timeOfDay;
        final now = new DateTime.now();
        question.initialzingDate = new DateTime(
            now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
        _checkTime = 1;
      });
    }
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 3
        ? setState(() => _currentStep += 1)
        : addQuestions(question);
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  void LengthOnSubmitted(String value, String field) {
    try {
      setState(() {
        question.Length = double.parse(value);
        _message = "";
      });
    } on FormatException catch (ex) {
      setState(() {
        _message = "${field} ne pas valide";
        _errorText = TextStyle(
            color: Colors.red, fontSize: 23, fontWeight: FontWeight.bold);
        question.Length = null;
      });
    }
  }

  void WeightOnSubmitted(String value, String field) {
    try {
      setState(() {
        question.Weight = double.parse(value);
        _message = "";
      });
    } on FormatException catch (ex) {
      setState(() {
        _message = "${field} ne pas valide";
        question.Weight = null;
      });
    }
  }

  void validationPerField(int checker) {
    List<String> errorField = [
      "Gender",
      "Age",
      "Weight",
      "Length",
      "TypeExercise",
      "CheckTime"
    ];
    setState(() {
      _message = errorField[checker] + " field that is not filled in";
    });
  }

  int validationAllFields(Firstpage quetion) {
    int checker = -1;
    if (gender == -1 && (checker = 0) >= 0 ||
        quetion.Age == null && (checker = 1) > 0 ||
        quetion.Length == null && (checker = 2) > 0 ||
        quetion.Weight == null && (checker = 3) > 0 ||
        quetion.typeExercise == null && (checker = 4) > 0 ||
        _checkTime == -1 && (checker = 5) > 0) {
      validationPerField(checker);
      return 0;
    } else {
      setState(() {
        _message = "";
      });
      return 1;
    }
  }

  Future addQuestions(Firstpage quetion) {
    final box = Boxes.getQuestions();
    question.isvisible = true;
    if (validationAllFields(question) == 1) {
      question.carb = 0.0;
      question.fat = 0.0;
      question.prot = 0.0;
      question.eating = 0.0;
      question.remining = 0.0;
      question.totalCal = 0.0;
      box.put('key', quetion);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => FoodCaloriesApp()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
