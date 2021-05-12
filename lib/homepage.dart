import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_app/model/user.dart';
import 'package:fyp_app/normaluser/normaluserpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyp_app/privilegeuser/privilegepage.dart';
import 'package:http/http.dart' as http;
import 'normaluser/normaluserpage.dart';
import 'privilegeuser/privilegepage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHidden = true;
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': pass};
    var jsonResponse;
    var response = await http.post("http://192.168.173.61:8000/api/login",
        headers: {'Accept': 'application/json'}, body: data);
    jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      if (jsonResponse != null) {
        User user = User.fromJson(response.body);
        setState(() {});
        sharedPreferences.setString('Token', jsonResponse['token']);
        sharedPreferences.setInt('ID', jsonResponse['id']);
        if (user.role == "student") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NormalUser()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrivilegeActivity()),
          );
        }
      }
    } else {
      setState(() {});
      print(response.body);
      Fluttertoast.showToast(
          msg: "Bad credentials",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }
  Future<bool> _onBackPressed(){
    return showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: Text("Do you really want to leave?"),
        actions: <Widget>[
          ElevatedButton(
            child: Text("No"),
            onPressed: () => Navigator.pop(context, false),
          ),
          ElevatedButton(child: Text("Yes"),
            onPressed: () => //Navigator.pop(context, true),
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (BuildContext context) => exit(0),
              ),
              (Route route) => false,
            ), 
          ),
        ]
      ));
  }
  // ignore: unused_field
  String _email;
  // ignore: unused_field
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
              child: SingleChildScrollView(
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: EmailFieldValidator.validate,
                          onSaved: (val) => _email = val,
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: passwordController,
                          obscureText: _isHidden,
                          validator: PasswordFieldValidator.validate,
                           onSaved: (val) => _password = val,
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
                          _form.currentState.validate();
                          signIn(emailController.text, passwordController.text);
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
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
class EmailFieldValidator{
  static String validate(String val){
    return val.isEmpty ? 'Email can\'t be empty' :null;
  }
}
class PasswordFieldValidator{
  static String validate(String val){
    return val.isEmpty ? 'Password can\'t be empty' :null;
  }
}