import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login/presentation/login_page.dart';
import 'steps/step.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<OnBoardingStep> _steps = const [
    OnBoardingStep(
      imageAssetURL: 'assets/images/on_boarding/step_01.png',
      text: 'Texto 1',
    ),
    OnBoardingStep(
        imageAssetURL: 'assets/images/on_boarding/step_02.jpg',
        text: 'Texto 2'),
    OnBoardingStep(
        imageAssetURL: 'assets/images/on_boarding/step_03.jpg',
        text: 'Texto 3'),
    OnBoardingStep(
      imageAssetURL: 'assets/images/on_boarding/step_03.jpg',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade200,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 8, right: 8),
              child: Text(
                'Eventos da UTFPR',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            PageView(
              children: _steps,
              // physics: AlwaysScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_steps.length, (index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 20 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color:
                            _currentPage == index ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    );
                  }),
                ),
              ),
            ),
            Visibility(
              visible: _currentPage != _steps.length - 1,
              child: Positioned(
                bottom: 8,
                right: 8,
                child: FloatingActionButton(
                  heroTag: 'next',
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Icon(Icons.arrow_forward),
                ),
              ),
            ),
            Visibility(
              visible: _currentPage != 0,
              child: Positioned(
                bottom: 8,
                left: 8,
                child: FloatingActionButton(
                  heroTag: 'previous',
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ),
            Visibility(
              visible: _currentPage == _steps.length - 1,
              child: Positioned(
                bottom: 8,
                right: 8,
                child: FloatingActionButton(
                  heroTag: 'access',
                  onPressed: () async {
                    final SharedPreferencesAsync asyncPrefs =
                        SharedPreferencesAsync();

                    await asyncPrefs.setBool('show_on_boarding', false);

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text('Acessar'),
                ),
              ),
            ),
          ],
        ),
      ),

      // floatingActionButton: Visibility(
      //   visible: _currentPage == 0,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       _pageController.nextPage(
      //         duration: const Duration(milliseconds: 400),
      //         curve: Curves.easeInOut,
      //       );
      //     },
      //     child: const Icon(Icons.arrow_forward),
      //   ),
      // ),
    );
  }
}
