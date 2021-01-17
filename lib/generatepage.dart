
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrscanner/model.dart';

class GeneratePage extends StatefulWidget {
  @override
  _GeneratePageState createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  
  GlobalKey<FormState> _key = GlobalKey();
  
  Products dummyData;
  TextEditingController qrTextController = TextEditingController();
  TextEditingController productname = TextEditingController();
  TextEditingController vendorname = TextEditingController();
  TextEditingController sellingprice= TextEditingController();
  TextEditingController discountprice = TextEditingController();
  
  String pname, vname, sp, dp;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Generate QR code"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          // ignore: deprecated_member_use
          autovalidate: true,
          child: Container(
            child: Column(
              children: [
                Row(
                children: [
                  Text("Vendor Name : "),
                  SizedBox(width: 12.0,),
                  Container(
                    height: 30.0,
                    width: 250.0,
                    child: TextFormField(
                      autofocus:  true,
                      controller: vendorname,
                      decoration: InputDecoration(
                      ),
                      onSaved: (String value){
                        vname = value;
                      },
                    ),
                  )
                ],
              ),
                SizedBox(height: 25.0),
                Row(
                  children: [
                    Text("Product Name : "),
                    SizedBox(width: 12.0,),
                    Container(
                      height: 30.0,
                      width: 250.0,
                      child: TextFormField(
                        autofocus:  true,
                        controller: productname,
                        decoration: InputDecoration(
                        ),
                        onSaved: (String value){
                          pname = value;
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25.0),
                Row(
                  children: [
                    Text("Selling Price : "),
                    SizedBox(width: 12.0,),
                    Container(
                      height: 30.0,
                      width: 250.0,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        autofocus:  true,
                        controller: sellingprice,
                        decoration: InputDecoration(
                        ),
                        onSaved: (String value){
                          sp = value;
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25.0),
                Row(
                  children: [
                    Text("Discount Price : "),
                    SizedBox(width: 12.0,),
                    Container(
                      height: 30.0,
                      width: 250.0,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        autofocus:  true,
                        controller: discountprice,
                        decoration: InputDecoration(
                        ),
                        onSaved: (String value){
                          dp = value;
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25.0),
              RaisedButton(
                  child: Text("submit"),
                  onPressed: (){
                    setState(() {
                      dummyData = Products()== ""?
                      null :
                      Products(
                        vendorname: vendorname.text,
                        productname: productname.text,
                        sellingprice: sellingprice.text,
                        discountprice: discountprice.text
                      );
                    });
                  }),
                (dummyData == null)
                ?Center(child: Text("Enter some text to display qr code..."))
                  :QrImage(
                data: vendorname.text,
              gapless: true,
              )
              ],
            ),
          ),
        ),
      )
    );
  }
}
