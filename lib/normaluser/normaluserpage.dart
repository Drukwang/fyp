//import 'package:fyp_app/main.dart';
import 'package:fyp_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fyp_app/normaluser/updatepofile.dart';
import 'package:fyp_app/normaluser/viewprofile.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'password.dart';
import 'contactus.dart';

class NormalUser extends StatefulWidget {
  NormalUser({Key key}) : super(key: key);
  @override
  _NormalUserState createState() => _NormalUserState();
}


String qrData = "No data found!";
var data;
bool hasdata = false;
class _NormalUserState extends State<NormalUser> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Student Activity Record',
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
                  Divider(

                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                    child: ListTile(
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
                  ),
                  Divider(),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: ListTile(
                      leading: Icon(Icons.arrow_back),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Form(
           key: formKey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.values[5],            
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 120),
                height: 400,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 250,
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
                            if (formKey.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ViewPofile()),
                              );
                            }
                          },
                          child: Text(
                            'View Profile',
                            style: TextStyle(
                              fontFamily: 'PTSerif',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ), 
                    ),
                    SizedBox(
                    width: 250,
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
                          if (formKey.currentState.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UpdatePofile()),
                            );
                          }
                        },
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                            fontFamily: 'PTSerif',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ), 
                  ),
                  SizedBox(
                      width: 250,
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
                            if (formKey.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PasswordUpdate()),
                              );
                            }
                          },
                          child: Text(
                            'Change Password',
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
              ),
              
              InkWell(
                child: Container(               
                    child: Image.asset('assets/scan-image.png',
                      fit: BoxFit.cover,
                      height: 70,
                      width: 70,
                    ),
                                    
                  ),
                onTap: () async {
                    var options = ScanOptions(
                      autoEnableFlash: false,
                    );
                    var data = await BarcodeScanner.scan(options: options);
                    setState(() {
                      qrData = data.rawContent.toString();
                      hasdata = true;
                    });
                  },
              ),
                // onPressed: () async{
                //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRScanPage()));
                // },         
                      
            ],
          ),
        ),
      ),
    );
  }
}
// onPressed: () async {
//   String codeScanner =await BarcodeScanner.scan();
//   setState((){
//     qrCodeResult = codeScanner;
//   });
// },