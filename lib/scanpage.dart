import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String qrCodeResult;
  bool backCamera = true;
  int camera= 1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Using" + (backCamera ? "Front Cam" : "Back Cam")),
        actions: [
          IconButton(
              icon: backCamera ?
              Icon(Icons.camera)
              :Icon(Icons.camera_alt),
              onPressed: (){
                setState(() {
                  backCamera= !backCamera;
                  camera = backCamera ? 1: -1;
                });
              }),
          IconButton(
              icon: Icon(Icons.qr_code_scanner),
              onPressed: () async{
                ScanResult codeScanner = await BarcodeScanner.scan(
                  options:  ScanOptions(
                    useCamera: camera,
                  )
                );
                setState(() {
                  qrCodeResult = codeScanner.rawContent;
                });
              })
        ],
      ),
      body: Center(
        child: Text(
            (qrCodeResult== null)|| (qrCodeResult == "")?
                "Please Scan to Show Some Result"
                : "Result: " + qrCodeResult,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
