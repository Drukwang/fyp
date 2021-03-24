import 'package:flutter/material.dart';


class ManualUpdate extends StatefulWidget {
  @override
  _ManualUpdateState createState() => _ManualUpdateState();
}

class _ManualUpdateState extends State<ManualUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Manual Update',
          style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListTile(
              focusColor: Colors.amberAccent,
              leading: CircleAvatar(
                radius: 30,
                child: Icon(Icons.person),
              ),
              title: Text('Name: Drukwang Norbu',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text('0217508.cst@ub.edu.bt'),
            ),
          ),
          Table(
            border: TableBorder.all(color: Colors.black),
            children: [
              TableRow(
                  children: <Widget> [
                    Container(
                      height: 50,
                      width: 11,                      
                      child:Text('Sl No.',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PTSerif',
                        ),
                      ), 
                    ),
                    Container(
                      height: 50,
                      width: 11,                      
                      child:Text('Activity Name',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'PTSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                    ),    
                    Container(
                      height: 50,
                      width: 11,                      
                      child:Text('Date',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'PTSerif',
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      
                    ), 
                    Container(
                      height: 50,
                      width: 11,                      
                      child:Text('Category',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'PTSerif',
                        fontWeight: FontWeight.bold,
                      ),
                      ),                    
                    ),
                    Container(
                      height: 50,
                      width: 11,                      
                      child:Text('Types',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'PTSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                    ),
                    Container(
                      height: 50,
                      width: 11,                      
                      child:Text('Remarks',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'PTSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                    ),
                    Container(
                      height: 50,
                      width: 11,                      
                      child:Text('Edit',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: 'PTSerif',
                          fontWeight: FontWeight.bold,
                        ),
                      ), 
                    ),
                     
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 11,                      
                      
                    ),
                    Container(
                      height: 50,
                      width: 11,                      
                      
                    ),    
                    Container(
                      height: 50,
                      width: 11,                      
                     
                    ), 
                    Container(
                      height: 50,
                      width: 11,                      
                                        
                    ),
                    Container(
                      height: 50,
                      width: 11,                      
                      
                    ),
                    Container(
                      height: 50,
                      width: 11,                      
                      
                    ),
                    Container(child: Row(
                      children: <Widget>[
                        Icon(Icons.delete),
                        Icon(Icons.add),
                      ],
                    ),
                      height: 50,
                      width: 11,                      
                    ),
                  ]
                ),
                
            ],
          ),                  
        ],        
      ),
    );
  }
}