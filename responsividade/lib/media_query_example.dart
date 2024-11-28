import 'package:flutter/material.dart';

class AdvancedMediaQueryExample extends StatelessWidget {
  const AdvancedMediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.sizeOf(context)
        .height; //  MediaQuery.of(context).size.height;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final titleFontSize = screenWidth * (screenWidth < 770 ? 0.04 : 0.03);

    return Scaffold(
      appBar: AppBar(title: const Text('Advanced MediaQuery Example')),
      body: Padding(
        padding: EdgeInsets.all(
            screenWidth * 0.01), // Padding baseado na largura da tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                ),
                child: Center(
                  child: Text(
                    'Dimensões da Tela\nLargura: ${screenWidth.toStringAsFixed(1)}\nAltura: ${screenHeight.toStringAsFixed(1)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                      child: Center(
                        child: Text(
                          isPortrait
                              ? 'Modo Retrato\n(Orientação: Portrait)'
                              : 'Modo Paisagem\n(Orientação: Landscape)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                      child: Center(
                        child: Text(
                          'Proporção:\n${(screenWidth / screenHeight).toStringAsFixed(2)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              // flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                ),
                child: Center(
                  child: Text(
                    'Use MediaQuery\npara criar\nlayouts dinâmicos!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
