import 'package:flutter/material.dart';

import 'answer.dart';

class SectionTwo extends StatefulWidget {
  const SectionTwo({Key? key}) : super(key: key);

  @override
  _SectionTwoState createState() => _SectionTwoState();
}

class _SectionTwoState extends State<SectionTwo> {
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
                  textAlign: TextAlign.center,
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
    'question': '1. What is the Full Form of GSLV?',
    'answers': [
      {'answerText': 'Global Satellite Launch Vehicle', 'score': false},
      {'answerText': 'Geosynchronous Service Launch Vehicle', 'score': false},
      {'answerText': 'Geosynchronous Satellite Launch Vehicle', 'score': true},
      {'answerText': 'Geo Satellite Launch Vehicle', 'score': false},
    ],
  },
  {
    'difficulty': 'Medium',
    'question':
    '2. Who is the Father of the Indian Space Program?',
    'answers': [
      {'answerText': 'C. V. Raman', 'score': false},
      {'answerText': 'Vikram Sarabhai', 'score': true},
      {'answerText': 'M. G. K. Menon', 'score': false},
      {'answerText': 'A. P. J. Abdul Kalam', 'score': false},
    ],
  },
  {
    'difficulty': 'Hard',
    'question': '3. Which type of Indian Satellites did Not Fail even once?',
    'answers': [
      {'answerText': 'PSLV', 'score': false},
      {'answerText': 'GSLV Mk III', 'score': true},
      {'answerText': 'GSLV Mk V', 'score': false},
      {'answerText': 'GSLV Mk VI', 'score': false},
    ],
  },
  {
    'difficulty': 'Medium',
    'question': '4. When was Chandrayaan-1 launched?',
    'answers': [
      {'answerText': '22 October 2018', 'score': false},
      {'answerText': '22 October 2006', 'score': false},
      {'answerText': '22 October 2008', 'score': true},
      {'answerText': '22 October 2010', 'score': false},
    ],
  },
  {
    'difficulty': 'Hard',
    'question':
    '5. When was Chandrayaan-2 launched?',
    'answers': [
      {'answerText': '22 July 2018', 'score': false},
      {'answerText': '22 July 2019', 'score': true},
      {'answerText': '22 July 2020', 'score': false},
      {'answerText': '22 July 2015', 'score': false},
    ],
  },
  {
    'difficulty': 'Easy',
    'question': '6. Where was Chandrayaan-2 launched?',
    'answers': [
      {'answerText': 'ISRO Satellite Centre', 'score': false},
      {'answerText': 'Satish Dhawan Space Centre First LaunchPad', 'score': false},
      {'answerText': 'Satish Dhawan Space Centre Second LaunchPad', 'score': true},
      {'answerText': 'Laboratory for Electro-Optics Systems', 'score': false},
    ],
  },
  {
    'difficulty': 'Medium',
    'question': '7. Where are Indian Satellites Manufactured?',
    'answers': [
      {'answerText': 'Laboratory for Electro-Optics Systems (LEOS)', 'score': false},
      {'answerText': 'Vikram Sarabhai Space Centre (VSSC)', 'score': false},
      {'answerText': 'Space Applications Centre (SAC)', 'score': false},
      {'answerText': 'ISRO Satellite Centre (ISAC)', 'score': true},
    ],
  },
  {
    'difficulty': 'Hard',
    'question': '8. Name the First Satellite built by India?',
    'answers': [
      {'answerText': 'Rohini RS-1', 'score': false},
      {'answerText': ' Aryabhata', 'score': true},
      {'answerText': 'Chandrayaan-1', 'score': false},
      {'answerText': 'SPADEX', 'score': false},
    ],
  },
  {
    'difficulty': 'Easy',
    'question': '9. Which is the First Navigation Satellite of India?',
    'answers': [
      {'answerText': 'IRNSS-3A', 'score': false},
      {'answerText': 'IRNSS-2A', 'score': false},
      {'answerText': 'IRNSS-1A', 'score': true},
      {'answerText': 'IRNSS-7A', 'score': false},
    ],
  },
  {
    'difficulty': 'Medium',
    'question': '10. Who renamed MetSat-1 to Kalpana-1 on 1st February 2003?',
    'answers': [
      {'answerText': 'A. P. J. Abdul Kalam', 'score': false},
      {'answerText': 'Atal Bihari Vajpayee', 'score': true},
      {'answerText': 'Narendra Modi', 'score': false},
      {'answerText': 'Jawaharlal Nehru', 'score': false},
    ],
  },
];
