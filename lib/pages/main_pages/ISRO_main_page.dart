import 'package:flutter/material.dart';

class ISROMainPage extends StatefulWidget {
  const ISROMainPage({Key? key}) : super(key: key);

  @override
  _ISROMainPageState createState() => _ISROMainPageState();
}

class _ISROMainPageState extends State<ISROMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/main_page'),
        ),
        titleSpacing: 45,
        title: Text("ISRO Knowledge section"),
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
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/spacecraft'),
                  child: Text(
                    "Spacecrafts",
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
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
                  child: Text("Launchers",
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/launcher'),
                ),
              ),
              SizedBox(
                height: 50,
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
                  child: Text("Customer Satellites",
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/satellite'),
                ),
              ),
              SizedBox(
                height: 50,
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
                  child: Text("Centres",
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/centre'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
