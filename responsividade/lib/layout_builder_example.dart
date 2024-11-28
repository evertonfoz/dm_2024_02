import 'package:flutter/material.dart';

class AdvancedLayoutBuilderExample extends StatelessWidget {
  const AdvancedLayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced LayoutBuilder Example')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1000) {
            // Layout para telas muito grandes (Desktop/Tablet em Paisagem)
            return _buildWideScreenLayout(constraints);
          } else if (constraints.maxWidth > 600) {
            // Layout para telas médias (Tablet ou celulares grandes)
            return _buildMediumScreenLayout(constraints);
          } else {
            // Layout para telas pequenas (Celulares)
            return _buildSmallScreenLayout(constraints);
          }
        },
      ),
    );
  }

  Widget _buildWideScreenLayout(BoxConstraints constraints) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blueGrey,
            child: Center(
              child: Text(
                'Menu Lateral',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.02,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: Colors.lightBlue,
            child: Center(
              child: Text(
                'Conteúdo Principal\n(Tela Grande)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.015,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMediumScreenLayout(BoxConstraints constraints) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.orange,
            child: Center(
              child: Text(
                'Header\n(Tela Média)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.05,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.orangeAccent,
                  child: Center(
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.deepOrange,
                  child: Center(
                    child: Text(
                      'Conteúdo Principal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: constraints.maxWidth * 0.04,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSmallScreenLayout(BoxConstraints constraints) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Header',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.05,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.redAccent,
            child: Center(
              child: Text(
                'Conteúdo Principal\n(Tela Pequena)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.045,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.red[700],
            child: Center(
              child: Text(
                'Footer',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.05,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
