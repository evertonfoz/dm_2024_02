import 'package:flutter/material.dart';

class HeroAnimationSecondPage extends StatelessWidget {
  const HeroAnimationSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Página'),
        actions: [
          Hero(
            tag: 'hero-tag',
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/UTFPR_logo.svg/800px-UTFPR_logo.svg.png',
                width: 40,
                height: 40,
                // fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}
