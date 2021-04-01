import 'package:flutter/material.dart';

class UpdatePofile extends StatefulWidget {
  @override
  _UpdatePofileState createState() => _UpdatePofileState();
}

class _UpdatePofileState extends State<UpdatePofile> {
 final formKey = GlobalKey<FormState>();
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'UpdateProfile',
          style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Container( 
        margin: EdgeInsets.all(10),          
        child: Form(
          key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Flexible(                  
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(
                            child: Text('FName:',
                                style: TextStyle(
                                  fontFamily: 'PTSerif',
                                  fontSize: 20,
                                ),
                              ),
                          ),                          
                          
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter your first Name:',
                              ),
                            )
                          ),
                        ],
                      
                      ),
                    ),
                  
                ),
                Flexible(                  
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Flexible(
                            child: Text('MName:',
                                style: TextStyle(
                                  fontFamily: 'PTSerif',
                                  fontSize: 20,
                                ),
                              ),
                          ),                          
                          
                          Flexible(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter your middle Name:',
                              ),
                            )
                          ),
                        ],
                      
                      ),
                    ),
                  
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: Text('LName:',
                            style: TextStyle(
                              fontFamily: 'PTSerif',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        
                        Flexible(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your last Name:',
                            ),
                          )
                        ),
                      ],
                    
                    ),
                  ),
                ),
                
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: Text('Department:',
                            style: TextStyle(
                              fontFamily: 'PTSerif',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Flexible(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your department',
                            ),
                          )
                        ),
                      ],
                    
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          child: Text('Student Number:',
                            style: TextStyle(
                              fontFamily: 'PTSerif',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Flexible(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Std No.',
                            ),
                          )
                        ),
                              
                      ],                
                    ),
                  ),
                ),                
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget> [  
                      Padding(
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
                          },
                          child: Text(
                            'Update',
                            style: TextStyle(
                              fontFamily: 'PTSerif',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
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
                            Navigator.pop(
                              context,
                            );
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'PTSerif',
                              fontSize: 20,
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
    );
  }
}



