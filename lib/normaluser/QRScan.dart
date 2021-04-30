// class _QRViewExampleState extends State<QRViewExample> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode result;
//   QRViewController controller;

//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller.resumeCamera();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: (result != null)
//                   ? Text(
//                       'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
//                   : Text('Scan a code'),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }

// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/material.dart';
// //import 'package:url_launcher/url_launcher.dart';

// class QRScanPage extends StatefulWidget {
//   QRScanPage({Key key}) : super(key: key);
//   @override
//   _QRScanPageState createState() => _QRScanPageState();
// }
// String qrData = "No data found!";
// var data;
// bool hasdata = false;
// class _QRScanPageState extends State<QRScanPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//       tag: "Scan QR",
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("QR Scanner"),
//           centerTitle: true,
//         ),
//         body: Container(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Flexible(
//                     child: Text(
//                       "Raw Data:  ${(qrData)}",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.scanner),
//                     onPressed: hasdata
//                         ? () async {
//                             if (await canLaunch(qrData)) {
//                               print(qrData);
//                               await launch(qrData);
//                             } else {
//                               throw 'Could not launch ';
//                             }
//                           }
//                         : null,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 15),
//               Container(
//                 width: ((MediaQuery.of(context).size.width) / 2) - 45,
//                 height: 35,
//                 child: OutlineButton(
//                   focusColor: Colors.red,
//                   highlightColor: Colors.blue,
//                   hoverColor: Colors.lightBlue[100],
//                   splashColor: Colors.blue,
//                   borderSide: BorderSide(
//                     width: 3,
//                     color: Colors.blue,
//                   ),
//                   shape: StadiumBorder(),
//                   child: Text(
//                     "Scan QR",
//                     style: TextStyle(fontSize: 17),
//                   ),
//                   onPressed: () async {
//                     var options = ScanOptions(
//                       autoEnableFlash: false,
//                     );
//                     var data = await BarcodeScanner.scan(options: options);
//                     setState(() {
//                       qrData = data.rawContent.toString();
//                       hasdata = true;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }