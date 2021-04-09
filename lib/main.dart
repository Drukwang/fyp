//import 'package:fyp_app/normaluser/normaluserpage.dart';

//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fyp_app/privilegeuser/privilegepage.dart';
//import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

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
  SharedPreferences sharedPreferences;
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
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
class HomePage extends StatefulWidget {  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  
   bool _isHidden = true;
   bool success = false;
   final GlobalKey<FormState> _form = GlobalKey<FormState>();
   final TextEditingController emailController = new TextEditingController();
   final TextEditingController passwordController = new TextEditingController();
  // Future<void> signIn(String email, password) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   Map data = {
  //     'email': email,
  //     'password': password,
  //   };
  //   var jsonResponse;    
  //   Uri uri = Uri.parse("http://192.168.43.145:3000/users/sign_in/");
  //   var response = await http.post(uri, headers: {'Accept':'application/json'}, body: data);    
  //   if(response.statusCode == 200) {
  //     jsonResponse = json.decode(response.body);
  //     if(jsonResponse != null) {
  //       setState(() {
  //         success = false;
  //       });        
  //       sharedPreferences.setString("token", jsonResponse['token']);
  //       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => PrivilegeActivity()), (Route<dynamic> route) => false);
  //     }
  //   }
  //   else {
  //     setState(() {
  //       success = false;
  //     });
      
  //     print(response.body);
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Form(
          key: _form,
            child: Container(
              width: 500,
              height: 500,
            margin: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                    Image.asset(
                      'assets/cstlogo.png',
                      width: 180,
                      height: 180,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 35),
                      child: Text('Log in',
                      textAlign: TextAlign.center,
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
                            controller: emailController,
                            validator: (val){
                              if(val.isEmpty)
                                return 'please enter emailID';
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: ' Email ID',
                              icon: Icon(Icons.email),
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
                            controller: passwordController,
                            obscureText: _isHidden,
                            validator: (val){
                              if(val.isEmpty)
                                return 'please enter the password';
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              icon: Icon(Icons.lock),
                              labelStyle: TextStyle(
                                fontFamily: 'PTSerif',
                                fontSize: 20
                              ),
                              // suffix: InkWell(
                              //  // onTap: _togglePasswordView,
                              //   // child: Icon(
                              //   //   _isHidden 
                              //   //   ? Icons.visibility 
                              //   //   : Icons.visibility_off,
                              //   // ),
                              // ),
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
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PrivilegeActivity()));
                            // setState(() {
                            //   success = true;
                            // });
                            
                          // emailController.text == "" || passwordController.text == "" ? null : () {
                          //   setState(() {
                          //     _isLoading = true;
                          //     });
                              //signIn(emailController.text, passwordController.text);
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
        ),
      ),
    );
  }
  // void _togglePasswordView() {
  //   setState(() {
  //     _isHidden = !_isHidden;
  //   });
  // }  
  //void setState(Null Function() param0) {}
}
