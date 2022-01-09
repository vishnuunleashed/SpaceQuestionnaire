import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:new_2/modules/launchers_model.dart';

class Launcher {
  Future<LauncherModel1> getSpaceCraft() async {
    var temp = null;
    var response =
    await http.get(Uri.parse("https://isro.vercel.app/api/launchers"));

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        temp = LauncherModel1.fromJson(jsonMap);
        print(temp);
        print("Success");
      } else {
        print("Request failed");
      }
    } catch (Exception) {
      print("Exception");
    }
    return temp;
  }
}

class LauncherClass extends StatefulWidget {
  const LauncherClass({Key? key}) : super(key: key);

  @override
  _LauncherClassState createState() => _LauncherClassState();
}

class _LauncherClassState extends State<LauncherClass> {
  Future<LauncherModel1>? temp1;

  void initState() {
    temp1 = Launcher().getSpaceCraft();
    print("Heeloo");
    print(temp1);
    print("Heeloo");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/ISRO_main_page'),
        ),
        title: Text("Spacecrafts"),
      ),
      body: FutureBuilder<LauncherModel1>(
          future: temp1,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.launchers!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration:BoxDecoration(

                              border: Border.all(width: 10,color: Colors.cyan),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Text(
                                  (snapshot.data!.launchers![index].id).toString()),

                            ],),),

                      ],
                    );
                  });
            } else {
              return Center(child: Container(child: CircularProgressIndicator()));
            }
          }),
    );
  }
}
