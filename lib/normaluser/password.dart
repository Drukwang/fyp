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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[           
                 Container(
                   margin: EdgeInsets.only(top: 100),
                  child: CircleAvatar(
                       child: Icon(Icons.person,
                       size: 50,),  
                       radius: 50,            
                    ),
                 ),
                 Container(
                   margin: EdgeInsets.only(top: 50),
                   child: TextFormField(
                     controller: _prePassController,
                     validator: (val){
                       if(val.isEmpty)
                        return 'enter previous password';
                        return null;
                     },
                     obscureText: _isHidden,                 
                     decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Enter previous password',
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden 
                          ? Icons.visibility 
                          : Icons.visibility_off,
                        ),
                      ),            
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'PTSerif',
                      ),
                      
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(top: 30),
                   child: TextFormField(
                     controller: _newPassController,
                     validator: (val){
                       if(val.isEmpty)
                        return 'enter new password';
                        return null;
                     },
                     obscureText: _isHidden,
                     decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Enter new password',
                      suffix: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(
                          _isHidden 
                          ? Icons.visibility 
                          : Icons.visibility_off,
                        ),
                      ), 
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'PTSerif',
                      ),
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(top: 30),
                   child: TextFormField(
                     controller: _newConfirmPassController,
                     validator: (val){
                       if(val.isEmpty)
                          return 'Empty';
                            if(val != _newPassController.text)
                              return 'new password doest not match';
                            return null;                    
                     },
                     decoration: InputDecoration(
                      labelText: 'Confirm new password',
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'PTSerif',
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
  //void setState(Null Function() param0) {}
}