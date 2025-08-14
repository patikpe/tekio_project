import 'package:flutter/material.dart';
import 'package:tekio_app/core/database/local_database.dart';
// import 'package:playground_flutter/core/logger/app_logger.dart';
import 'package:tekio_app/features/app/app.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB().initLocalDatabase();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await AppLogger().initLog();
  runApp(const MainApp());
}
