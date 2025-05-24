import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_admin_panel/app.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

/// Entry point of Flutter App
Future<void> main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetX Local Storage

  // Remove # sign from url

  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // .then((_) => Get.put(AuthenticationRepository()));

  // Main App Starts here...
  runApp(const TStoreAdminPanelApp());
}
