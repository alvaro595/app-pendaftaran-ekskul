import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/form_page.dart';
import 'pages/data_page.dart';
import 'pages/galery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pendaftaran Ekstrakurikuler',

      home: const HomePage(),

      routes: {
        '/home': (context) => const HomePage(),
        '/form': (context) => const FormPage(),
        '/data': (context) => const DataPage(),
        '/galery': (context) => const GalleryPage(),
      },
    );
  }
}