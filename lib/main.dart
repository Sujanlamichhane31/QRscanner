import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:qrscanner/generatepage.dart';
import 'package:qrscanner/scanpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QR Scanner",
     debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController qrTextController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr Scanner'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text("Scan Code"),
              leading: Icon(Icons.qr_code_scanner),
              onTap: (){
                Navigator.of(context).push( MaterialPageRoute(builder: (_)=>ScanPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Generate QR Code"),
              leading: Icon(Icons.qr_code_scanner_sharp),
              onTap: (){
                Navigator.of(context).push( MaterialPageRoute(builder: (_)=>GeneratePage()));
              },
            ),
          )
        ],
      )
    );
  }
}
