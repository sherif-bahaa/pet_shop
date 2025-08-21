import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/models/user_model.dart';

import '../Firebase/firebase_function.dart';

class AppProvider extends ChangeNotifier {
  UserModel? userModel;
  User? firebaseUser;

  AppProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
      notifyListeners();
    }
  }

  Future<void> initUser() async {
    userModel = await FirebaseFunctions.getUserData();
    notifyListeners();
  }
}
