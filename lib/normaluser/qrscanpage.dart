import 'package:barcode_scan/barcode_scan.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_app/homepage.dart';
import 'package:fyp_app/normaluser/contactus.dart';
import 'package:fyp_app/normaluser/password.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:barcode_scan/barcode_scan.dart' as ScanResult;

import 'normaluserpage.dart';

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
    var obtainedToken = sharedPreferences.getInt('ID');
    setState(() {
      userID = obtainedToken;
    });
  }

  void addData(String activityID) async {
    ///print("user_image:  $image");f
    String uid = userID.toString();
    //int actID = int.parse(activityID);

    //Map data = {'user_id': uid, 'activity_id': activityID};

    var data = new Map();

    data['user_id'] = uid;
    data['activity_id'] = activityID;

    Uri uri = Uri.parse("http://192.168.173.61:8000/api/participation");
    var response = await http.post(uri,
        headers: {
          'Authorization': 'Bearer $Value',
          'Accept': 'application/json',
          'Content_Type': 'multipart/form-data',
          //'Content-Type': 'application/json;charset=UTF-8'
        },
        body: data);

    // ignore: non_constant_identifier_names
    if (response.statusCode == 201) {
      Fluttertoast.showToast(
          msg: "Scan Done",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
          setState(() {
            
          });
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => NormalUser()));
     } else {
       setState(() {
        
      });
      Fluttertoast.showToast(
          msg: "Unable to Scan",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
          Navigator.push(
          context, MaterialPageRoute(builder: (context) => NormalUser()));
     }
  }

  void initState() {
    getValidation();
    getUserID();
    super.initState();
  }

  //bool scanned = false;
  String result = "Press the camera to start the scan !";
  Future scanQR() async {
    String result1;
    try {
      ScanResult.ScanResult qrScanResult = await BarcodeScanner.scan();
      String qrResult = qrScanResult.rawContent;
      result1 = qrResult;
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
    addData(result1);
  }
  Future<bool> _onBackPressed(){
    return showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: Text("Do you really want to log out?"),
        actions: <Widget>[
          ElevatedButton(
            child: Text("No"),
            onPressed: () => Navigator.pop(context, false),
          ),
          ElevatedButton(child: Text("Yes"),
            onPressed: () => 
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => HomePage(),
              ),
              (Route route) => false,
            ), 
          ),
        ]
      ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(       
        title: Text("QR Scanner",
         style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24,
          ),
        ),
        centerTitle: true,        
      ),
       drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/cstlogo.png'),
                    radius: 60,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('About Us',
                        style: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
                        )),
                        onTap: (){
                          Navigator.push(
                            context,  MaterialPageRoute(builder: (context) => ContactUs()),);
                        },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Update Password',
                        style: TextStyle(
                          fontFamily: 'PTSerif',
                          fontSize: 20,
                        )),
                        onTap: (){
                          Navigator.push(
                            context,  MaterialPageRoute(builder: (context) => PasswordUpdate()),);
                        },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Log Out',
                      style: TextStyle(
                        fontFamily: 'PTSerif',
                        fontSize: 20,
                      )),
                    onTap: _onBackPressed,
                  ),
                    
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          result,
          textAlign: TextAlign.center,
          style: new TextStyle(fontFamily: 'PTSerif',
            fontSize: 28,),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
            icon: Icon(Icons.camera_alt),
            label: Text("Scan"),
            onPressed: () {
              scanQR();

              return QRScanPage();
            }),
      ),
    );
  }
}
