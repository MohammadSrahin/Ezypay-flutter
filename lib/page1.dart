import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class page extends StatefulWidget {
  @override
  _pageState createState() => _pageState();
}

class _pageState extends State<page> {
 bool  isInitilized=false;
  @override
  void initState() {
  FlutterMobileVision.start().then((value) {
    isInitilized=true;
  });
    super.initState();
  }
  void_startScan()async{
    List<OcrText> list=List();
    try{
   list=await FlutterMobileVision.read(
      waitTap: true,
      fps:5,
     multiple: true,
    );
    for(OcrText text in list){
      print('values ${text.value}');
    }
    }catch(e){

    }
  }
 String _data="";

 Future<String> _scan()async{
   return await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.BARCODE).then((value) => _data=value);
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5f6f2e),
        title: Text('EZY SCAN'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: ()async{setState(() {
                        _data= _scan().toString();
                      });
                      },


                      child: Card(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),

                        child: ListTile(
                          leading: Text('بدء تصوير باركور',
                           // textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Text(_data),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        void_startScan();
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),

                        child: ListTile(
                          leading: Text('بدء تصوير سيريال',
                            textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),

                      child: ListTile(
                        leading: Text('تصدير و إرسال',
                          textAlign: TextAlign.center,

                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
                      child: ListTile(
                        leading: Text('Refresh',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

