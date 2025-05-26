import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:t_store_admin_panel/routes/routes.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

// Firebase Auth Instance:
  final _auth = FirebaseAuth.instance;

// Get Authenticated User Data:
  User? get authUser => _auth.currentUser;

  // Get isAuthenticated User:
  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }

// Login

// Register:

// Register user by admin:

// email verification:

// forget password:

// re authentication user:

// Logout user:

// Delete user:
}
