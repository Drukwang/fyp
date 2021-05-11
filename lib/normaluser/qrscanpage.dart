import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart' as ScanResult;
import 'package:flutter/services.dart';
//import 'package:qr_flutter/qr_flutter.dart';

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  String result = "press the camera to start the scan !";
Future _scanQR() async {
    try {
      ScanResult.ScanResult qrScanResult = await BarcodeScanner.scan();
      String qrResult = qrScanResult.rawContent;
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }
  //String result = "scanned successfully";
//    //bool scanned = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(     
//       body: Center(

//         child: ElevatedButton(
//           child: Text("scan"),
//           onPressed: _scanQR, 
//         ),
//       ) 
        
//         // if (!scanned) {
//         //   scanned = true;
//         //   Navigator.pop(
//         //     context,
//         //     MaterialPageRoute(builder: (context) => ViewRecords()),
//         //   );
//         // }  
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("QR Scanner",
         style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          result,
          textAlign: TextAlign.center,
           style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 28,
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
          icon: Icon(Icons.camera_alt),
          label: Text("Scan"),
          onPressed: _scanQR,
        ),
      ),
    );
  }
}