import 'package:fapp/core/styles/GlobalTheme.dart';
import 'package:fapp/core/utils/global_utils.dart';
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
  TextEditingController ageController = TextEditingController();
  TextEditingController legthController = TextEditingController();
  TextEditingController wightController = TextEditingController();
  TextStyle _errorText = TextStyle(
    color: Colors.red,
    fontSize: 15,
  );
  String _message = "";
  TimeOfDay timeofnow = TimeOfDay.now();
  Firstpage question;

  @override
  void initState() {
    final mybox = Boxes.getQuestions();
    question = mybox.get('key');
    if (question == null) {
      question = new Firstpage();
    }
    _currentStep = 0;
    gender = -1;
    _state = -1;
    _checkTime = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            ShareButton(),
          ],
          title: Center(
            child: Text('User Settings',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "greycliff-cf-regular")),
          ),
          leading: (question.isvisible)
              ? new IconButton(
                  icon: new Icon(Icons.chevron_left),
                  onPressed: () => Navigator.pop((context)),
                )
              : Container(),
          backgroundColor: GlobalTheme.lightOrange,
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(_message, style: _errorText),
              ),
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
                        title: new Text('User Setting'),
                        content: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: ageController,
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
                              controller: legthController,
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
                              controller: wightController,
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
                        title: new Text('Daily exercices level'),
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
                                Text("No Exercises"),
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
                                Text("Light Exercises"),
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
                                Text("Moderate Exercises"),
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
                                Text("Intense Exercises"),
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
                                Text("Very Intense Exercises"),
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
                        title: new Text('Reseting Time'),
                        content: Column(
                          children: <Widget>[
                            Text(
                                "You need to choose a time for resetting The EATEN calories value to 0.00 kcal, this process will happen every 24 hours from the time you picked (we recommend the waking up time)\n also you could change it any time from the user settings option",
                                textAlign: TextAlign.center),
                            TextButton(
                              style: ButtonStyle(alignment: Alignment.center),
                              onPressed: () {
                                _selectTime(context);
                              },
                              child: Text("Choose a Time"),
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
        int timeDiff = now.compareTo(question.initialzingDate);
        question.initialzingDate = timeDiff >= 0
            ? question.initialzingDate.add(Duration(hours: 24))
            : question.initialzingDate;
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
      "Length",
      "Weight",
      "Exercise level",
      "CheckTime"
    ];
    setState(() {
      _message = errorField[checker] + " field that is not filled in";
    });
  }

  int validationAllFields(Firstpage quetion) {
    int checker = -1;
    if (gender == -1 && (checker = 0) >= 0 ||
        ageController.text.isEmpty && (checker = 1) > 0 ||
        legthController.text.isEmpty && (checker = 2) > 0 ||
        wightController.text.isEmpty && (checker = 3) > 0 ||
        _state == -1 && (checker = 4) > 0 ||
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
    Firstpage questionTmp = box.get('key');
    question.isvisible = true;

    if (validationAllFields(question) == 1) {
      if (questionTmp == null) {
        question.carb = 0.0;
        question.fat = 0.0;
        question.prot = 0.0;
        question.eating = 0.0;
        question.remining = 0.0;
        question.totalCal = 0.0;
        box.put('key', quetion);
      } else {
        question.save();
      }
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => FoodCaloriesApp()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
