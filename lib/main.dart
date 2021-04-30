import 'package:flutter/material.dart';
//import 'package:fyp_app/normaluser/normaluserpage.dart';
import 'package:fyp_app/privilegeuser/privilegepage.dart';
//import 'package:fluttertoast/fluttertoast.dart';
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
   final GlobalKey<FormState> _form = GlobalKey<FormState>();
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

  // bool  success = false;
  // var token;
  // var data;
  // Future<void> logIn( String email, password) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Map data = {      
  //     "email": email,
  //     "password": password,      
  //   };
    
    //var response;

  //   Uri uri = Uri.parse("http://192.168.43.145:8000/api/auth/login");
  //   var res = await http.post(uri, headers: {'Accept':'application/json'}, body: data);
  //  // var res = await http.post(uri, body:data);
  //   var encodeFirst = json.encode(res.body);
  //   //var response = json.decode(encodeFirst);
  //   if (res != null) {
  //     if (res.statusCode == 200) {       
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => PrivilegeActivity()));
        
  //         // setState(() {
  //         //   success = true;
  //         // });
  //         prefs.setString("token", res['token']);
        
  //         return Fluttertoast.showToast(
  //             msg: "${res['logged in successfully']}",
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.BOTTOM,
  //             timeInSecForIosWeb: 1,
  //             backgroundColor: Colors.greenAccent,
  //             textColor: Colors.white,
  //             fontSize: 16.0
  //         );
        
  //     }
      
  //   }
  //   else {        
  //       // setState(() {
  //       //   success = true;
  //       // });
  //       return Fluttertoast.showToast(
  //           msg: "${['na']}",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.greenAccent,
  //           textColor: Colors.white,
  //           fontSize: 16.0
  //       );
  //     }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Form(
          key: _form,
            child: Container(
              width: 500,
              height: 600,
            margin: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
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
                    Container(
                      height: 65,
                      child: Card(
                         shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ), 
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                         child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: TextFormField(
                                controller: emailController,
                                validator: (val){
                                  if(val.isEmpty)
                                    return 'please enter emailID';
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  labelText: ' Email ID',
                                  icon: Icon(Icons.email),
                                  labelStyle: TextStyle(
                                    fontFamily: 'PTSerif',
                                    fontSize: 20
                                  ),
                                ),
                              ),
                            ),
                          //),
                      ),
                    ),
                      Container(
                        height: 65,
                        child: Card(
                          shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ), 
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: TextFormField(                              
                                controller: passwordController,
                                obscureText: _isHidden,
                                validator: (val){
                                  if(val.isEmpty)
                                    return 'please enter the password';
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  labelText: 'Password',
                                  icon: Icon(Icons.lock),
                                  labelStyle: TextStyle(
                                    fontFamily: 'PTSerif',
                                    fontSize: 20
                                  ),
                                  suffix: InkWell(
                                   onTap: _togglePasswordView,
                                    child: Icon(
                                      _isHidden 
                                      ? Icons.visibility 
                                      : Icons.visibility_off,
                                    ),
                                  ),
                                ),
                              ),
                            ), 
                        ),
                      ),
                    Container(
                      height: 50,
                      width: 120,
                      margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                      child:Padding(
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
                          onPressed: //emailController.text == "" || passwordController.text == "" ? null : 
                          () { 
                             Navigator.push(context, MaterialPageRoute(builder: (context) => PrivilegeActivity()));                         
                            //logIn(emailController.text, passwordController.text);
                          },
                           
                         child: Text(
                            'Log In',
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
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }  
}
