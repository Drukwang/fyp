import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_app/normaluser/qrscanpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PasswordUpdate extends StatefulWidget {
  @override
  _PasswordUpdateState createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _prePassController = new TextEditingController();
  final TextEditingController _newPassController = new TextEditingController();
  final TextEditingController _newConfirmPassController =
      new TextEditingController();
  // ignore: non_constant_identifier_names
  String Value;
  bool _isHidden = true;
  bool _isHidden1 = true;
  bool _isHidden2 = true;

  Future getValidation() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString('Token');
    setState(() {
      Value = obtainedToken;
    });
  }

  void addData(String oldPassword, newPassword, confirmPassword) async {
    ///print("user_image:  $image");f
    Uri uri = Uri.parse("http://192.168.173.61:8000/api/change-password");
    http.post(uri, headers: {
      'Authorization': 'Bearer $Value',
      "Accept": "application/json",
      'Content_Type': 'multipart/form-data',
    }, body: {
      "old_password": "$oldPassword",
      "new_password": "$newPassword",
      "confirm_password": "$confirmPassword",
    }).then((response) {
      // ignore: non_constant_identifier_names
      var JsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        if (JsonResponse != null) {
          Fluttertoast.showToast(
            msg: "Password changed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
          Navigator.pop(
            context, MaterialPageRoute(builder: (context) => QRScanPage()));
        }
      } else {
          return Fluttertoast.showToast(
            msg: "Password does not match",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    });
  }

  @override
  void initState() {
    setState(() {});

    getValidation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Change Password',
          style: TextStyle(fontFamily: 'PTSerif', fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 150, 0, 0),
          child: Form(
            key: _form,
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 30, 30, 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Card(
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
                        showCursor: true,
                        obscureText: _isHidden,
                        controller: _prePassController,
                        validator: (val) {
                          if (val.isEmpty) return 'enter previous password';
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: 'Enter previous password',
                          labelStyle: TextStyle(
                            fontFamily: 'PTSerif',
                            fontSize: 20,
                            color: Colors.black,
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
                  Card(
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
                        showCursor: true,
                        obscureText: _isHidden1,
                        controller: _newPassController,
                        validator: (val) {
                          if (val.isEmpty) return 'enter new password';
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: 'Enter new password',
                          labelStyle: TextStyle(
                            fontFamily: 'PTSerif',
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          suffix: InkWell(
                            onTap: _togglePasswordView1,
                            child: Icon(
                              _isHidden1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
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
                        showCursor: true,
                        obscureText: _isHidden2,
                        controller: _newConfirmPassController,
                        validator: (val) {
                          if (val.isEmpty) return 'Empty';
                          if (val != _newPassController.text)
                            return 'password doest not match';
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          labelText: 'Enter again to confirm',
                          labelStyle: TextStyle(
                            fontFamily: 'PTSerif',
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          suffix: InkWell(
                            onTap: _togglePasswordView2,
                            child: Icon(
                              _isHidden2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints.tightFor(width: 150, height: 50),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.lightBlueAccent),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        side: BorderSide(color: Colors.black))),
                              ),
                              onPressed: () {
                                _form.currentState.validate();
                                addData(
                                    _prePassController.text,
                                    _newPassController.text,
                                    _newConfirmPassController.text);
                              },
                              child: Text(
                                'Change',
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
  void _togglePasswordView1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }
  void _togglePasswordView2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }
}
