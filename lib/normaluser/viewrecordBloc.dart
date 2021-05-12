import 'dart:async';
import 'dart:convert';
import 'package:fyp_app/model/participation.dart';
import 'package:http/http.dart' as http;
//import 'package:fyp_app/model/participation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum getActivity { 
  Fetch
}

// ignore: camel_case_types
class viewrecordBloc {
  final _stateStreamController = StreamController<List<Activity>>();
  StreamSink<List<Activity>> get _pendingSink =>
      _stateStreamController.sink;
  Stream<List<Activity>> get pendingStream =>
      _stateStreamController.stream;

  final _eventStreamController = StreamController<getActivity>();
  StreamSink<getActivity> get eventSink => _eventStreamController.sink;
  Stream<getActivity> get _eventStrem => _eventStreamController.stream;

  viewrecordBloc() {
    _eventStrem.listen((event) async {
      if (event == getActivity.Fetch) {
        try {
          var post = await getPost();
          if (post != null) {
            _pendingSink.add(post.activity);
          } else {
            _pendingSink.addError("Error");
          }
        // ignore: unused_catch_clause
        } on Exception catch (e) {
          _pendingSink.addError('error');
        }
      }
    });
  }
  void dispose() {
    _eventStreamController.close();
    _stateStreamController.close();
  }

  // ignore: non_constant_identifier_names
  String Token;
  Future<String> getValidation() async {
    final prefs = await SharedPreferences.getInstance();
    Token = prefs.getString('Token');
    return Token;
  }

  int userID;
  Future getUserID() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    userID = sharedPreferences.getInt('ID');
    return userID;
  }

  Future<Participation> getPost() async {
    var eData;
    var value = await getValidation();
    var userID = await getUserID();
    try {
      var response = await http.get(
          Uri.parse("http://192.168.173.61:8000/api/getactivities/$userID"),
          headers: {
            "Accept": "application/json",
            //'Content_Type': 'multipart/form-data',
            'Authorization': 'Bearer $value',
          });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        print(jsonMap);
        eData = Participation.fromJson(jsonMap);
      }
    } catch (Exception) {
      return eData;
    }

    print(eData);
    return eData;
  }
}
