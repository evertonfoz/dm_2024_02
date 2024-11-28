import 'package:flutter/material.dart';

class AdvancedFlexibleExpandedExample extends StatelessWidget {
  const AdvancedFlexibleExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Flexible & Expanded')),
      body: Column(
        children: [
          // Header (Ocupa 10% do espaço)
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Header',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          // Body (Ocupa 70% do espaço)
          Expanded(
            flex: 7,
            child: Row(
              children: [
                // Sidebar (Ocupa 30% do espaço do Body)
                Flexible(
                  flex: 3,
                  child: Container(
                    color: Colors.orange,
                    child: const Center(
                      child: Text(
                        'Sidebar',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                // Main Content (Ocupa 70% do espaço do Body)
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      // Top Content (Metade do espaço do Main Content)
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.green,
                          child: const Center(
                            child: Text(
                              'Top Content',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      // Bottom Content (Metade do espaço do Main Content)
                      Flexible(
                        flex: 1,
                        child: Container(
                          color: Colors.lightGreen,
                          child: const Center(
                            child: Text(
                              'Bottom Content',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Footer (Ocupa 20% do espaço)
          Flexible(
            flex: 2,
            child: Container(
              color: Colors.red,
              child: const Center(
                child: Text(
                  'Footer',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
