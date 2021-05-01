
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/homepage.dart';
import 'package:fyp_app/normaluser/contactus.dart';
import 'package:fyp_app/normaluser/password.dart';
import 'normaluserpage.dart';

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
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
      // void barcode() async {

      //   var options = ScanOptions(
          
      //   );

      //   var result = await BarcodeScanner.scan();
      //   print(result.rawContent);

      // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Scan QR',
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
                    leading: Icon(Icons.person),
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
                        onTap: (){
                          Navigator.push(
                            context,  MaterialPageRoute(builder: (context) => HomePage()),);
                        },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: InkWell(     
          // onTap: () async {
          //   var options = ScanOptions(
          //     autoEnableFlash: false,
          //   );
          //   var data = await BarcodeScanner.scan(options: options);
          //   setState(() {
          //     qrData = data.rawContent.toString();
          //     hasdata = true;
          //   });
          // },    
          //   Future options () async {
          //           var options = ScanOptions(
          //             autoEnableFlash: false,
          //           );
          //           var data = await BarcodeScanner.scan(options: options);
          //           setState(() {
          //             qrData = data.rawContent.toString();
          //             hasdata = true;
          //           });
          // },                            
      ),      
    );
  }
}