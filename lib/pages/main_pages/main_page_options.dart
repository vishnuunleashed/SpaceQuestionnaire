import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 125,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/login'),
        ),
        title: Text("Options"),
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
                width: 300,
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
                      context, '/ISRO_main_page'),
                  child: Text(
                    "ISRO Knowledge section",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 100,
                width: 300,
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
                  child: Text("Questionnaire",
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context,'/mcq_main'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
