import 'package:animations/hero/hero_animation_first_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'container/animated_container_page.dart';
import 'custom/custom_animated_page.dart';
import 'tween/tween_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Center(
        child: Lottie.asset('assets/lotties/confirm.json'),
      ),
    );
  }
}
