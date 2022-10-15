import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:io_karolbryzgiel_flutter/views/pages/case-list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack4Law',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: CaseList(),
    );
  }
}