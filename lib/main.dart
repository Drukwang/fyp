import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fyp_app/normaluser/normaluserpage.dart';
import 'package:fyp_app/privilegeuser/privilegepage.dart';
import 'package:http/http.dart' as http;
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
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
  Future<void> sendData(String email, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map data = {
      "email": email,
      "password": password,
    };
    //var bodys = json.encode(data);
    var response;
    Uri uri = Uri.parse("http://10.2.25.206:8000/api/auth/login");
    var res = await http.post(uri, headers: {'Accept':'application/json'}, body: data);
    response = json.decode(res.body);
    if (res.statusCode == 200) {
      if (response != null) {
        setState(() {
          success = false;
        });

        //Response['email'];
        prefs.setString('Token', response['token']);
        prefs.setString('Email', response['email']);
        //saveToken = Response['token'].toString();
         //print(Response['token']);
        Navigator.push(context, MaterialPageRoute(builder: (context) => PrivilegeActivity()));
        return Fluttertoast.showToast(
            msg: "${response['msg']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.greenAccent,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
    else{
      setState(() {
        success = false;
      });
      // Map<String, dynamic> data = new Map<String, dynamic>.from(json.decode(res.body));
      //   print(data['data']['msg']);
        return Fluttertoast.showToast(
            msg: "${response['msg']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
    }
  }

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
                          //),
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
                          onPressed: (){
                           setState(() {
                            success = true;
                          });
                          sendData(emailController.text, passwordController.text);
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
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }  
}
