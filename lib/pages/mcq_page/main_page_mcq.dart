


import 'package:flutter/material.dart';

class MCQMainPage extends StatefulWidget {
  const MCQMainPage({Key? key}) : super(key: key);

  @override
  _MCQMainPageState createState() => _MCQMainPageState();
}

class _MCQMainPageState extends State<MCQMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 125,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/main_page'),
        ),
        title: Text("Subjects"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               SizedBox(
                height: 100,
                width: 350,
                child: ElevatedButton(
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
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, '/mcqspacecraft'),
                  child: Text(
                    "Spacecrafts Questionnaire",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              SizedBox(
                height: 100,
                width: 350,
                child: ElevatedButton(
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
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, '/mcqlauncher'),
                  child: Text(
                    "Launchers Questionnaire",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              SizedBox(
                height: 100,
                width: 350,
                child: ElevatedButton(
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
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, '/mcqsatellite'),
                  child: Text(
                    "Customer Satellites Questionnaire",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
