import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:new_2/modules/centre_model.dart';
import 'package:new_2/modules/launchers_model.dart';
import 'package:new_2/modules/satellitre_model.dart';




class Centre {
  Future<CentreModel> getSpaceCraft() async {
    var temp = null;
    var response =
    await http.get(Uri.parse("https://isro.vercel.app/api/centres"));

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        temp = CentreModel.fromJson(jsonMap);
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

class CentreClass extends StatefulWidget {
  const CentreClass({Key? key}) : super(key: key);

  @override
  _CentreClassState createState() => _CentreClassState();
}

class _CentreClassState extends State<CentreClass> {
  Future<CentreModel>? temp1;

  void initState() {
    temp1 = Centre().getSpaceCraft();
    print("Heeloo");
    print(temp1);
    print("Heeloo");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 65,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/ISRO_main_page'),
        ),
        title: Text("Centres"),
      ),
      body: FutureBuilder<CentreModel>(
          future: temp1,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.centres!.length,
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
                                  (snapshot.data!.centres![index].id).toString()),
                              SizedBox(height: 10),
                              Text(
                                  (snapshot.data!.centres![index].name).toString()),
                              SizedBox(height: 10),
                              Text(
                                  (snapshot.data!.centres![index].place).toString()),
                              SizedBox(height: 10),
                              Text(
                                  (snapshot.data!.centres![index].state).toString()),

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
