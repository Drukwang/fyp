import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QRGenerated extends StatefulWidget {
  final myQR;
  const QRGenerated(this.myQR);
  @override
  _QRGeneratedState createState() => _QRGeneratedState();
}

class _QRGeneratedState extends State<QRGenerated> {
  GlobalKey _globalKey = GlobalKey();
  Directory directory;
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
              children: <Widget> [
                Container(
                    width: 180,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,5,0),
                      child: GestureDetector(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.black)
                              ),
                            ),                        
                          ),
                          onPressed:() async {
                            RenderRepaintBoundary imageObject = _globalKey.currentContext.findRenderObject();
                            final image = await imageObject.toImage(pixelRatio: 2);
                            ByteData bytedata = await image.toByteData(format:ImageByteFormat.png);
                            final pngBytes = bytedata.buffer.asUint8List();
                            //final base64String = base64Encode(pngBytes);
                            directory = await getExternalStorageDirectory();
                            //Directory tempDir = await getApplicationDocumentsDirectory();
                            String tempPath = directory.path;
                            var file = File("$tempPath/filename.png");
                            await file.writeAsBytes(pngBytes);                               
                            
                            

                          },                         
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
                      onPressed: () async {
                        RenderRepaintBoundary imageobject = _globalKey.currentContext.findRenderObject();
                        final image =  await imageobject.toImage(pixelRatio: 2);
                        ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
                        final pngBytes = byteData.buffer.asUint8List();
                        //final base64String = base64Encode(pngBytes);

                        await Share.file(
                          'esys image', 'esys.png', pngBytes, 'image/png',
                          text:'my optional');
                      //_captureAndSharePng();
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
}
                       