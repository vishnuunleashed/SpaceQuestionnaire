import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:new_2/modules/launchers_model.dart';
import 'package:new_2/modules/satellitre_model.dart';




class Satellite {
  Future<SatelliteModel1> getSpaceCraft() async {
    var temp = null;
    var response =
    await http.get(Uri.parse("https://isro.vercel.app/api/customer_satellites"));

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        temp = SatelliteModel1.fromJson(jsonMap);
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

class SatelliteClass extends StatefulWidget {
  const SatelliteClass({Key? key}) : super(key: key);

  @override
  _SatelliteClassState createState() => _SatelliteClassState();
}

class _SatelliteClassState extends State<SatelliteClass> {
  Future<SatelliteModel1>? temp1;

  void initState() {
    temp1 = Satellite().getSpaceCraft();
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
        title: Text("Customer Satellites"),
      ),
      body: FutureBuilder<SatelliteModel1>(
          future: temp1,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.customerSatellites!.length,
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
                                  (snapshot.data!.customerSatellites![index].id).toString()),
                              SizedBox(height: 10),
                              Text(
                                  (snapshot.data!.customerSatellites![index].country).toString()),
                              SizedBox(height: 10),
                              Text(
                                  (snapshot.data!.customerSatellites![index].launchDate).toString()),
                              SizedBox(height: 10),
                              Text(
                                  (snapshot.data!.customerSatellites![index].mass).toString()),
                              SizedBox(height: 10),
                              Text(
                                  (snapshot.data!.customerSatellites![index].launcher).toString()),
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
