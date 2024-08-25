import 'package:flutter/material.dart';
import 'package:aplikasi_sortir_nilai/column.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Penyortir Nilai',
      theme: _isDarkMode ? ThemeData.dark().copyWith(
        primaryColor: Color.fromARGB(255, 1, 31, 199),
        appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 2, 29, 138)),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.white),
        ),
      ) : ThemeData.light().copyWith(
        primaryColor: Colors.blue,
       appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlue),

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.black),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Penyortir Nilai'),
          foregroundColor: Colors.white,
          actions: [
            IconButton(
                icon: Icon(_isDarkMode ? Icons.light_mode : Icons.mode_night),
                onPressed: () {
                  setState(() {
                    _isDarkMode = !_isDarkMode; // Toggle mode tema
                  });
                })
          ],
        ),
        body: Padding(
          
          padding: EdgeInsets.all(16),
          child: ColumnWidget(),
        ))
    );
  }
}
