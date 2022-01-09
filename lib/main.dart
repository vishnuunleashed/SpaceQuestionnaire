import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_2/pages/ISRO_Knowledge_section/Customer_Satellite.dart';
import 'package:new_2/pages/ISRO_Knowledge_section/centre.dart';
import 'package:new_2/pages/ISRO_Knowledge_section/launchers.dart';
import 'package:new_2/pages/ISRO_Knowledge_section/space_crafts.dart';
import 'package:new_2/pages/main_pages/login.dart';
import 'package:new_2/pages/main_pages/ISRO_main_page.dart';
import 'package:new_2/pages/main_pages/main_page_options.dart';
import 'package:new_2/pages/main_pages/register_page.dart';
import 'package:new_2/pages/mcq_page/main_page_mcq.dart';
import 'package:new_2/pages/mcq_page/questionnaire/section_one/section_one.dart';
import 'package:new_2/pages/mcq_page/questionnaire/section_three/section_three.dart';
import 'package:new_2/pages/mcq_page/questionnaire/section_two/section_two.dart';
import 'package:new_2/pages/mcq_page/sub_mcq_page/launcher_mcq.dart';
import 'package:new_2/pages/mcq_page/sub_mcq_page/satellites_mcq.dart';
import 'package:new_2/pages/mcq_page/sub_mcq_page/spacecrafts_mcq.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/register': (BuildContext context) => RegisterPage(),
        '/main_page': (BuildContext context) => MainPage(),
        '/ISRO_main_page': (BuildContext context) => ISROMainPage(),
        '/spacecraft': (BuildContext context) => SpaceCraft(),
        '/launcher': (BuildContext context) => LauncherClass(),
        '/satellite':(BuildContext context) => SatelliteClass(),
        '/centre' : (BuildContext context) => CentreClass(),
        '/mcq_main':(BuildContext context) => MCQMainPage(),
        '/mcqspacecraft':(BuildContext context)=>MCQSpaceCraft(),
        '/mcqlauncher' : (BuildContext context)=>MCQSlauncher(),
        '/mcqsatellite': (BuildContext context)=>MCQSatellite(),
        '/sectionone': (BuildContext context) => SectionOne(),
        '/sectiontwo': (BuildContext context) => SectionTwo(),
        '/sectionthree': (BuildContext context) => SectionThree(),


      }
      ,
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.light().copyWith(
            primary: Colors.cyan[400], secondary: Colors.deepOrange[200]),
      ),
      home: const MyAppPack(),
    );
  }
}

class MyAppPack extends StatefulWidget {
  const MyAppPack({Key? key}) : super(key: key);

  @override
  _MyAppPackState createState() => _MyAppPackState();
}

class _MyAppPackState extends State<MyAppPack> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
