import 'package:flutter/material.dart';
import '1stpage.dart';
import 'settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: card(), routes: {
      customizw.id: (context) => customizw(
            value: '',
          ),
      '1stpage': (context) => card(),
    });
  }
}
