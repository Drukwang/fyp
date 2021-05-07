//import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_app/normaluser/normaluserpage.dart';
//import 'package:fyp_app/privilegeuser/privilegepage.dart';
//import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHidden = true;
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // Future<void> signIn(String email, pass) async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   Map data = {'email': email, 'password': pass};
  //   var jsonResponse;
  //   var response = await http.post("http://192.168.166.61:8000/api/login",
  //       headers: {'Accept': 'application/json'}, body: data);
  //   jsonResponse = json.decode(response.body);
  //   if (response.statusCode == 200) {
  //     if (jsonResponse != null) {
  //       setState(() {});
  //       sharedPreferences.setString('Token', jsonResponse['token']);
  //       //sharedPreferences.setString('Email', jsonResponse['email']);
  //       //sharedPreferences.setString('Name', jsonResponse['name']);
  //       sharedPreferences.setInt('ID', jsonResponse['id']);
  //       //sharedPreferences.setString("token", jsonResponse['token']);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => PrivilegeActivity()),
  //       );
  //     }
  //   } else {
  //     setState(() {});
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
                  child: Text(
                    'Log in',
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
                        validator: (val) {
                          if (val.isEmpty) return 'please enter emailID';
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
                          labelStyle:
                              TextStyle(fontFamily: 'PTSerif', fontSize: 20),
                        ),
                      ),
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
                        controller: passwordController,
                        obscureText: _isHidden,
                        validator: (val) {
                          if (val.isEmpty) return 'please enter the password';
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: 'Password',
                          icon: Icon(Icons.security),
                          labelStyle:
                              TextStyle(fontFamily: 'PTSerif', fontSize: 20),
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.lightBlueAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(color: Colors.black))),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NormalUser()),
                        );
                        // _form.currentState.validate();
                        // signIn(emailController.text, passwordController.text);
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
