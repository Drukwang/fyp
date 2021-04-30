import 'package:flutter/material.dart';
class PasswordUpdate extends StatefulWidget {
  @override
  _PasswordUpdateState createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  final GlobalKey<FormState> _form= GlobalKey<FormState>();
  final TextEditingController _prePassController = new TextEditingController();
  final TextEditingController _newPassController = new TextEditingController();
  final TextEditingController _newConfirmPassController = new TextEditingController();
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Change Password',
          style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Form(
            key: _form,
            child: Container(
              margin: EdgeInsets.fromLTRB(20,30,30,50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[  
                  Container(
                   margin: EdgeInsets.only(top: 100),
                  child: CircleAvatar(
                       child: Icon(Icons.person,
                       size: 50,),  
                       radius: 50,            
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
                        showCursor: true,
                        controller: _prePassController,
                        validator: (val){
                          if(val.isEmpty)
                            return 'enter previous password';
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
                        showCursor: true,
                        controller: _newPassController,
                        validator: (val){
                          if(val.isEmpty)
                            return 'enter new password';
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
                        showCursor: true,
                        controller: _newConfirmPassController,
                        validator: (val){
                          if(val.isEmpty)
                              return 'Empty';
                                if(val != _newPassController.text)
                                  return 'new password doest not match';
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
                 Container(
                   margin: EdgeInsets.only(top: 50),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget> [
                       Padding(
                        padding: const EdgeInsets.fromLTRB(5,0,5,0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 150, height: 50),
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
}