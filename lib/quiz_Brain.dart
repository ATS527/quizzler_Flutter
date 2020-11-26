import 'package:flutter/material.dart';
import 'question_Class.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionNo = 0;

  List<Icon> trackRecord = [];

  Widget trackRecordIcon(bool mark) {
    if (mark) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.close,
        color: Colors.red,
      );
    }
  }

  void resetApp(BuildContext context) {
    _questionNo = 0;
    trackRecord.clear();
    Alert(
      context: context,
      onWillPopActive: true,
      title: "Completed!",
      desc: "You have made it to the end nice!",
      id: "Quizzler",
      style: AlertStyle(animationType: AnimationType.fromTop),
      buttons: <DialogButton>[
        DialogButton(
          child: Text("Reset"),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.green,
        ),
        DialogButton(
          child: Text("Quit"),
          onPressed: null,
          color: Colors.red,
        ),
      ],
    ).show();
  }

  List<Question> _queAndAns = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  String getQuestion() {
    return _queAndAns[_questionNo].question;
  }

  bool getAnswer() {
    return _queAndAns[_questionNo].answer;
  }

  void nextQuestion() {
    print("_quesno = $_questionNo");
    print("_queandans length = ${_queAndAns.length}");

    if (isFinished() == false) {
      _questionNo++;
    }
  }

  // ignore: missing_return
  bool isFinished() {
    if (_questionNo < _queAndAns.length - 1) {
      return false;
    } else if (_questionNo == _queAndAns.length - 1) {
      return true;
    }
  }
}
