import 'package:flutter/material.dart';
import 'package:noteapp/models/note_database.dart';
import 'package:noteapp/pages/note_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Ensuring Flutter binding initialized...');
  final noteDatabase = NoteDatabase();
  await noteDatabase.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:NoteApp(),
    );
  }
}
