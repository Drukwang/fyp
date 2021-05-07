import 'package:flutter/material.dart';
import 'package:fyp_app/normaluser/qrscanpage.dart';
import 'package:fyp_app/normaluser/updatepofile.dart';
import 'package:fyp_app/normaluser/viewrecords.dart';

class NormalUser extends StatefulWidget {
  NormalUser({Key key}) : super(key: key);
  @override
  _NormalUserState createState() => _NormalUserState();
}

String qrData = "No data found!";
var data;
bool hasdata = false;
class _NormalUserState extends State<NormalUser> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    UpdatePofile(),
    ViewRecords(),
    QRScanPage(),
  ];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
       onTap:(index){
          setState(() {
            _currentIndex = index;
          });
        },
       
       items: [
         BottomNavigationBarItem(
           icon: Icon(Icons.person_add),
           label: 'Manage Profile',
         ),
        
         BottomNavigationBarItem(
           icon: Icon(Icons.collections_bookmark),
           label: 'Records',
         ),
          BottomNavigationBarItem(
           icon: Image.asset('assets/scan-image.png',
            height: 30,
            width: 30,
           ),
           label: 'Scan',
         ),
       ],       
     ),
      body: _children[_currentIndex],
    );
  }  
}
// onPressed: () async {
//   String codeScanner =await BarcodeScanner.scan();
//   setState((){
//     qrCodeResult = codeScanner;
//   });
// },