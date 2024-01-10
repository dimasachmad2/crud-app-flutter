import 'package:basic_crud/addDataPage.dart';
import 'package:basic_crud/editDataPage.dart';
import 'package:basic_crud/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/add-data': (context) => AddDataPage(),
        '/edit-page': (context) => EditDataPage(),
      },
    );
  }
}
