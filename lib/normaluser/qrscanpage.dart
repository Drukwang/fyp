import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'normaluserpage.dart';
import 'viewrecords.dart';

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  var console;
  void initState() {
    super.initState();
      var options = ScanOptions(
        autoEnableFlash: false,
      );
      var data = BarcodeScanner.scan(options: options);
      setState(() {
        qrData = data.toString();
        hasdata = true;
      });
  }
   //bool scanned = false;
  @override
  Widget build(BuildContext context) {
    return ViewRecords(        
        // if (!scanned) {
        //   scanned = true;
        //   Navigator.pop(
        //     context,
        //     MaterialPageRoute(builder: (context) => ViewRecords()),
        //   );
        // }  
    );
  }
}