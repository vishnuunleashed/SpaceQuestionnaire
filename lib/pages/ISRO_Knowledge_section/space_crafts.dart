import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:new_2/modules/spacecraft_model.dart';
import 'package:flutter/material.dart';

class SpaceCraftAPI {
  Future<LaunchersModel> getSpaceCraft() async {
    var temp = null;
    var response =
        await http.get(Uri.parse("https://isro.vercel.app/api/spacecrafts"));

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        temp = LaunchersModel.fromJson(jsonMap);
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

class SpaceCraft extends StatefulWidget {
  const SpaceCraft({Key? key}) : super(key: key);

  @override
  _SpaceCraftState createState() => _SpaceCraftState();
}

class _SpaceCraftState extends State<SpaceCraft> {
  Future<LaunchersModel>? temp1;

  void initState() {
    temp1 = SpaceCraftAPI().getSpaceCraft();
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
      body: FutureBuilder<LaunchersModel>(
          future: temp1,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data?.spacecrafts?.length,
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
                              (snapshot.data!.spacecrafts![index].id).toString()),
                          Text(
                              (snapshot.data!.spacecrafts![index].name).toString()),

                        ],),),

                        SizedBox(height: 50),
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
