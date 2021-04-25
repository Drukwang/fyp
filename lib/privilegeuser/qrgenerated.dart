//import 'dart:convert';
import 'dart:typed_data';
//import 'dart:ui' as ui;
import 'dart:ui';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
//import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:async';
import 'dart:io';

class QRGenerated extends StatefulWidget {
  final myQR;
  const QRGenerated(this.myQR);
  @override
  _QRGeneratedState createState() => _QRGeneratedState();
}

class _QRGeneratedState extends State<QRGenerated> {
  GlobalKey _globalKey = new GlobalKey();
  // Uint8List bytes1;
  // var filePath;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title: Text('QR Code',
          style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[                            
              RepaintBoundary(
                key: _globalKey,
                child: Container(                  
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,              
                  ),
                  height: 300,
                  width: 300,                     
                    child: QrImage(
                      data: widget.myQR,
                      version: QrVersions.auto,
                      size: 250.0,
                      gapless: false,
                    ),
                  ),
              ),              
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 180,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,5,0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Colors.black)
                          )
                        ),                        
                      ),
                      onPressed:(){},// _takeScreenShot,
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),                
                SizedBox(
                  width: 180,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,5,0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Colors.black)
                          )
                        ),                        
                      ),
                      onPressed: () {
                      _captureAndSharePng();
                      },                        
                      child: Text(
                        'Share',
                        style: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),                   
              ],
              ),
            ],
          ),
        ),
    );
  } 

  // void _takeScreenShot() async {
  //   RenderRepaintBoundary boundary =
  //       _globalKey.currentContext.findRenderObject();
  //   ui.Image image = await boundary.toImage();
  //   ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List pngBytes = byteData.buffer.asUint8List();
  //   print(pngBytes);
  //   var filePath = await ImagePickerSaver.saveFile(fileData: pngBytes);
  //   print(filePath);
  // }

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      final channel = const MethodChannel('channel:me.alfian.share/share');
      channel.invokeMethod('shareFile', 'image.png');

    } catch(e) {
      print(e.toString());
    }
  }
  // void capture() {
  // http.get('https://www.gravatar.com/avatar/e944138e1114aefe4b08848a46465589').then((response) {
  //   Uint8List bodyBytes = response.bodyBytes;
  //   File('my_image.jpg').writeAsBytes(bodyBytes);
  // });
  // }
}
                       