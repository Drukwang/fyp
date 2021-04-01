//import 'package:fyp_app/normaluser/normaluserpage.dart';
import 'package:fyp_app/privilegeuser/privilegepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
 
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage('assets/cstlogo.png'),
              width: 150,
              height: 150,
              alignment: Alignment.bottomCenter,
            ),
            alignment: Alignment.bottomCenter,
          ),
          SizedBox(
            width: 20.0,
            
          ),
          Text(
            'Student Activity Record System',
            style: TextStyle(
              fontFamily: 'PTSerif',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/cstlogo.png',
              width: 180,
              height: 180,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 35),
              child: Text('Log in',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'PTSerif',
                ),
              ),
            ),              
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: ' Email ID',
                      labelStyle: TextStyle(
                        fontFamily: 'PTSerif',
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'PTSerif',
                        fontSize: 20
                      )
                    ),
                  ),
                ),
              ),
            Container(
              height: 50,
              width: 100,
              margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivilegeActivity(),
                      ),
                    );
                  },
                  child: Text(
                    'log In',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'PTSerif',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            
            ),
          ],
        ),
      ),
    );
  }
}
