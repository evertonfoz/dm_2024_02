import 'package:flutter/material.dart';

import 'pages/counter_page.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.yellow,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Contador App',
      home: CounterPagina(),
    );
  }
}
