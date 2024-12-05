import 'package:animations/hero/hero_animation_second_page%20.dart';
import 'package:flutter/material.dart';

class HeroAnimationFirstPage extends StatelessWidget {
  const HeroAnimationFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Primeira Página')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HeroAnimationSecondPage()),
            );
          },
          child: Hero(
            tag: 'hero-tag',
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/UTFPR_logo.svg/800px-UTFPR_logo.svg.png',
              width: 200,
              height: 200,
              // fit: BoxFit.cover,
            ),
            // Container(
            //   width: 100,
            //   height: 100,
            //   color: Colors.blue,
            // ),
          ),
        ),
      ),
    );
  }
}
