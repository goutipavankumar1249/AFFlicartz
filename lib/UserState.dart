// import 'package:flutter/material.dart';
//
// class UserState extends ChangeNotifier {
//   late String _userId;
//   late String _UniqueKey;
//
//   String get userId => _userId;
//
//   void setUserId(String userId) {
//     _userId = userId;
//     notifyListeners(); // Notify listeners of the change
//   }
//
//   String get UniqueKey => _UniqueKey;
//   void setUniqueKey(String UniqueKey) {
//     _UniqueKey = UniqueKey;
//     notifyListeners(); // Notify listeners of the change
//   }
//
//
// }


import 'package:flutter/foundation.dart';

class UserState with ChangeNotifier {
  Map<String, dynamic>? userData;

  late String _userId;

  String get userId => _userId;

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners(); // Notify listeners of the change
  }

  void setUserData(Map<String, dynamic> data) {
    userData = data;
    notifyListeners();
  }
}

