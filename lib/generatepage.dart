
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratePage extends StatefulWidget {
  @override
  _GeneratePageState createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  
  String dummyData;
  TextEditingController qrTextController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Generate QR code"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Text("Enter the data "),
              SizedBox(width: 12.0,),
              Container(
                height: 30.0,
                width: 200.0,
                child: TextFormField(
                  autofocus:  true,
                  controller: qrTextController,
                  decoration: InputDecoration(
                  ),
                ),
              ),
             
            RaisedButton(
                child: Text("submit"),
                onPressed: (){
                  setState(() {
                    dummyData = qrTextController.text == ""
                    ? null :
                    qrTextController.text;
                  });
                }),
              (dummyData == null)
                  ? Center(child: Text("enter some text to display qr code..."))
                  : QrImage(
               
                data: dummyData,
                gapless: true,
              ),
            ],
          ),
        ),
      )
    );
  }
}
