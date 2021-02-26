import 'package:FYPApp/normaluser/normaluserpage.dart';
//import 'package:FYPApp/privilegeuser/privilegepage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: HomePage(),
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
              //fontFamily: ,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.amber[800],
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
      // appBar: AppBar(
      //   title: Text('Student Activity Record System'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue[600],
      // ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 0.0),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/cstlogo.png',
              width: 170,
              height: 170,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 35),
              child: Text('Log in',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),  
            //Container(
              //child: 
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'UserID',
                ),
              ),
            //),
            //Container(
              //child: 
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            //),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NormalUser(),
                    ),
                  );
                },
                child: Text(
                  'log in',
                  style: TextStyle(
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
