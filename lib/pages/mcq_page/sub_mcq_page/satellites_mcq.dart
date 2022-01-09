


import 'package:flutter/material.dart';

class MCQSatellite extends StatefulWidget {
  const MCQSatellite({Key? key}) : super(key: key);

  @override
  _MCQSatelliteState createState() => _MCQSatelliteState();
}

class _MCQSatelliteState extends State<MCQSatellite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 125,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/mcq_main'),
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
                      context, '/ISRO_main_page'),
                  child: Text(
                    "Are you ready?",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height : 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, '/sectionthree'),
                    child: Text(
                      "Yes",
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 50,),
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
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, '/mcq_main'),
                    child: Text(
                      "No",
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                  ),

                ],),


            ],
          ),
        ),
      ),
    );
  }
}
