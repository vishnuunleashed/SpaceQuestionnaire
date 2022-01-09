import 'package:flutter/material.dart';

import 'answer.dart';

class SectionOne extends StatefulWidget {
  const SectionOne({Key? key}) : super(key: key);

  @override
  _SectionOneState createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne> {
  List<Icon> _scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore){
    setState(() {
      answerSelected = true;
      if(answerScore){
        _totalScore++;
        correctAnswerSelected = true;
      }else{
        correctAnswerSelected = false;
      }
      _scoreTracker.add(
          answerScore==true ?
          Icon(Icons.check_circle,color: Colors.green)
              : Icon(Icons.clear,color: Colors.red)
      );

      if(_questionIndex + 1 == _questions.length)
        {
          endOfQuiz = true;

        }

    });

  }

  void _nextQuestion(){
    setState(() {
      _questionIndex++;
      answerSelected = false;


    });
    if(_questionIndex >= _questions.length){
       _resetQuiz();
    }
  }

  void _resetQuiz(){

    setState(() {
      _questionIndex =0;
      _totalScore = 0;
      _scoreTracker = [];
      endOfQuiz = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/main_page'),
        ),
        title: Text(
          'ISRO Questionnaire',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFFFAB91)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Color(0xFFFFAB91)),
                            ),
                          ),
                        ),
                        child: Text(
                          _questions[_questionIndex]['difficulty'].toString(),
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        onPressed: () {},
                    ),
                ),
                ..._scoreTracker,
              ],
            ),
            Container(
              width: double.infinity,
              height: 130.0,
              margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['question'].toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...(_questions[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map(
              (answer) => Answer(
                answerColor: answerSelected == true ? answer['score'] == true ? Colors.green:Colors.red : null,
                answerText: answer['answerText'].toString(),
                answerTap: (){
                  if(answerSelected){
                    return;
                  }
                 if(answer['score']==true){
                   _questionAnswered(true);
                 }else{
                   _questionAnswered(false);
                 }
                },
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFFFAB91)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Color(0xFFFFAB91)),
                  ),
                ),
              ),
              onPressed: (){
                  if(answerSelected == false){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Please select an answer before going to the next question'),
                    ));
                    return;
                  }
                _nextQuestion();
              },
              child: Text(
                endOfQuiz == true ?"Restart Questionnaire":"Next Question",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text('$_totalScore/10',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold)),
            ),
            if (answerSelected && !endOfQuiz)
            Container(
              height: 50,
              width: double.infinity,
              color: correctAnswerSelected == true ? Colors.green : Colors.red,
              child: Center(
                child: Text(
                  correctAnswerSelected == true
                      ? 'Correct Answer!'
                      : 'Incorrect Answer',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

final _questions = const [
  {
    'difficulty': 'Easy',
    'question': '1. Where is the Headquarters of the Indian Space Research Organisation (ISRO)?',
    'answers': [
      {'answerText': 'Pune', 'score': false},
      {'answerText': 'Bangalore', 'score': true},
      {'answerText': 'Lucknow', 'score': false},
      {'answerText': 'Mumbai', 'score': false},
    ],
  },
  {
    'difficulty': 'Medium',
    'question':
        '2. When was ISRO formed?',
    'answers': [
      {'answerText': '15 August 1947', 'score': false},
      {'answerText': '15 August 1952', 'score': false},
      {'answerText': '15 August 1969', 'score': true},
      {'answerText': '15 August 1967', 'score': false},
    ],
  },
  {
    'difficulty': 'Hard',
    'question': '3. What is the Full Form of SDSC?',
    'answers': [
      {'answerText': 'Satish Development Space Centre', 'score': false},
      {'answerText': 'Scientific Development Space Centre', 'score': false},
      {'answerText': 'Satish Dhawan Space Centre', 'score': true},
      {'answerText': 'Static Development Space Centre', 'score': false},
    ],
  },
  {
    'difficulty': 'Medium',
    'question': '4. Who is the Owner of the Indian Space Research Organisation?',
    'answers': [
      {'answerText': 'Department of Space', 'score': true},
      {'answerText': 'Department of State', 'score': false},
      {'answerText': 'Distributed Operating Space', 'score': false},
      {'answerText': 'Dioctyl Sebacate', 'score': false},
    ],
  },
  {
    'difficulty': 'Hard',
    'question':
        '5. Which Satellite is responsible for Communication and Television Broadcasting?',
    'answers': [
      {'answerText': 'IRS', 'score': false},
      {'answerText': 'INSATTP', 'score': false},
      {'answerText': 'INPUT', 'score': false},
      {'answerText': 'INSAT', 'score': true},
    ],
  },
  {
    'difficulty': 'Easy',
    'question': '6. Which Satellite is used for Resources Monitoring by ISRO?',
    'answers': [
      {'answerText': 'IRIS', 'score': false},
      {'answerText': 'INSAT', 'score': false},
      {'answerText': 'IRS', 'score': true},
      {'answerText': 'ISS', 'score': false},
    ],
  },
  {
    'difficulty': 'Medium',
    'question': '7. What is the Full Form of PSLV?',
    'answers': [
      {'answerText': 'Public Satellite Launch Vehicle', 'score': false},
      {'answerText': 'Polar Satellite Launch Vehicle', 'score': true},
      {'answerText': 'Polar Service Launch Vehicle', 'score': false},
      {'answerText': 'Public Service Launch Vehicle', 'score': false},
    ],
  },
  {
    'difficulty': 'Hard',
    'question': '8. When was the First Rocket launched from India?',
    'answers': [
      {'answerText': '21 December 1963', 'score': false},
      {'answerText': '21 October 1963', 'score': false},
      {'answerText': '21 November 1964', 'score': false},
      {'answerText': '21 November 1963', 'score': true},
    ],
  },
  {
    'difficulty': 'Easy',
    'question': '9. What was ISRO known before 1969?',
    'answers': [
      {'answerText': 'INCOSPAR', 'score': true},
      {'answerText': 'ACROSS', 'score': false},
      {'answerText': 'DAE', 'score': false},
      {'answerText': 'INSA', 'score': false},
    ],
  },
  {
    'difficulty': 'Medium',
    'question': '10. Where is the Indian Institute of Remote Sensing (IIRS)?',
    'answers': [
      {'answerText': 'Hyderabad', 'score': false},
      {'answerText': 'Dehradun', 'score': true},
      {'answerText': 'Ahmedabad', 'score': false},
      {'answerText': 'Sriharikota', 'score': false},
    ],
  },
];
