import 'package:flutter/material.dart';

import 'answer.dart';

class SectionThree extends StatefulWidget {
  const SectionThree({Key? key}) : super(key: key);

  @override
  _SectionThreeState createState() => _SectionThreeState();
}

class _SectionThreeState extends State<SectionThree> {
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
    'question': '1. Who is known as the Missile Man of India?',
    'answers': [
      {'answerText': 'Satyendra Nath Bose', 'score': false},
      {'answerText': 'Vikram Sarabhai', 'score': false},
      {'answerText': 'C.V. Raman', 'score': false},
      {'answerText': ' A. P. J. Abdul Kalam', 'score': true},
    ],
  },
  {
    'difficulty': 'Medium',
    'question':
    '2. Which Missile was developed Under A. P. J. Abdul Kalam’s Guidance?',
    'answers': [
      {'answerText': 'K15', 'score': false},
      {'answerText': 'MPATGM', 'score': false},
      {'answerText': 'Prithvi', 'score': true},
      {'answerText': 'Surya', 'score': false},
    ],
  },
  {
    'difficulty': 'Hard',
    'question': '3. Which is the First Successful Nuclear Bomb Test by India on 18 May 1974?',
    'answers': [
      {'answerText': 'Pokhran-II', 'score': false},
      {'answerText': 'Smiling Buddha', 'score': true},
      {'answerText': 'Angry Bird', 'score': false},
      {'answerText': 'PTR', 'score': false},
    ],
  },
  {
    'difficulty': 'Medium',
    'question': '4. When was the Indian National Committee for Space Research (INCOSPAR) Set Up?',
    'answers': [
      {'answerText': '1962', 'score': true},
      {'answerText': '1965', 'score': false},
      {'answerText': '1947', 'score': false},
      {'answerText': '1948', 'score': false},
    ],
  },
  {
    'difficulty': 'Hard',
    'question':
    '5. What is the Name of the Indian Space University?',
    'answers': [
      {'answerText': 'Physical Research Laboratory (PRL)', 'score': false},
      {'answerText': 'Indian Institute of Science (IISc)', 'score': false},
      {'answerText': 'Indian Institute of Remote Sensing (IIRS)', 'score': false},
      {'answerText': 'Indian Institute of Space Science & Technology (IIST)', 'score': true},
    ],
  },
  {
    'difficulty': 'Easy',
    'question': '6. Where is Vikram Sarabhai Space Centre?',
    'answers': [
      {'answerText': 'Ahmedabad', 'score': false},
      {'answerText': 'Chandigarh', 'score': false},
      {'answerText': 'Thiruvananthapuram', 'score': true},
      {'answerText': 'Mohali', 'score': false},
    ],
  },
  {
    'difficulty': 'Medium',
    'question': '7. Which Satellite is used by Tata Sky?',
    'answers': [
      {'answerText': 'CartoSat-1', 'score': false},
      {'answerText': 'INSAT-4CR', 'score': false},
      {'answerText': 'INSAT-99', 'score': false},
      {'answerText': 'INSAT-4A', 'score': true},
    ],
  },
  {
    'difficulty': 'Hard',
    'question': '8. Which Series of Indian Satellites are Decommissioned?',
    'answers': [
      {'answerText': 'ASLV', 'score': true},
      {'answerText': 'PSLV', 'score': false},
      {'answerText': 'GSLV', 'score': false},
      {'answerText': 'GSLV', 'score': false},
    ],
  },
  {
    'difficulty': 'Easy',
    'question': '9. How many Polar Satellite Launch Vehicle (PSLV) failed during the 1990s?',
    'answers': [
      {'answerText': '4', 'score': false},
      {'answerText': '3', 'score': false},
      {'answerText': '0', 'score': false},
      {'answerText': '1', 'score': true},
    ],
  },
  {
    'difficulty': 'Medium',
    'question': '10. When did Chandrayaan-1 Enter the Mars orbit?',
    'answers': [
      {'answerText': '24 September 2019', 'score': false},
      {'answerText': '24 September 2014', 'score': true},
      {'answerText': '24 September 2008', 'score': false},
      {'answerText': '24 September 2018', 'score': false},
    ],
  },
];
