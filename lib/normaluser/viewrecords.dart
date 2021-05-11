import 'package:flutter/material.dart';

class ViewRecords extends StatefulWidget {
  @override
  _ViewRecordsState createState() => _ViewRecordsState();
}

class _ViewRecordsState extends State<ViewRecords> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Your Records',
          style: TextStyle(
            fontFamily: 'PTSerif',
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),     
       body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    child: Container(
                      width: 500,
                      height: 130,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    child: Container(
                      width: 500,
                      height: 130,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    child: Container(
                      width: 500,
                      height: 130,
                    ),
                  ),
                ),Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    child: Container(
                      width: 500,
                      height: 130,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    child: Container(
                      width: 500,
                      height: 130,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    child: Container(
                      width: 500,
                      height: 130,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    child: Container(
                      width: 500,
                      height: 130,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    child: Container(
                      width: 500,
                      height: 130,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.8),
                        width: 1,
                      ),
                    ),
                    child: Container(
                      width: 500,
                      height: 130,
                    ),
                  ),
                ),
              ],
            ),
          )  
        ) 
    );
  }
}