import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fyp_app/homepage.dart';
//import 'package:fyp_app/normaluser/contactus.dart';
//import 'package:fyp_app/normaluser/password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'normaluserpage.dart';
import 'package:http/http.dart' as http;
//import 'normaluserpage.dart';
import 'viewrecords.dart';

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  var console;

  // ignore: non_constant_identifier_names
  String Value;
  Future getValidation() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString('Token');
    setState(() {
      Value = obtainedToken;
    });
  }

  int userID;
  Future getUserID() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString('ID');
    setState(() {
      userID = obtainedToken as int;
    });
  }

  void addData(String activityID) async {
    ///print("user_image:  $image");f
    int actID = int.parse(activityID);
    Map data = {'user_id': userID, 'activity_id': actID};
    Uri uri = Uri.parse("http://192.168.166.61:8000/api/participation");
    var response = await http.post(uri,
        headers: {
          'Authorization': 'Bearer $Value',
          'Accept': 'application/json'
          //'Content-Type': 'application/json;charset=UTF-8'
        },
        body: data);

    // ignore: non_constant_identifier_names
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Scan Done",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NormalUser()));
    } else {
      Fluttertoast.showToast(
          msg: "Unable to Scan",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.greenAccent,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void initState() {
    getValidation();
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
