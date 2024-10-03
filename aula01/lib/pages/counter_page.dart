import 'package:flutter/material.dart';

class CounterPagina extends StatefulWidget {
  const CounterPagina({super.key});

  @override
  State<CounterPagina> createState() => _CounterPaginaState();
}

class _CounterPaginaState extends State<CounterPagina> {
  var _counterCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador App'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Número de cliques:'),
            Text('$_counterCount'),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counterCount++;
                  });
                },
                child: const Text('Clique aqui')),
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     Flexible(
      //       flex: 5,
      //       child: Container(
      //         color: Colors.orange,
      //         child: const Center(
      //           child: Column(
      //             mainAxisSize: MainAxisSize.max,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: <Widget>[
      //               Text('Número de cliques:'),
      //               Text('0'),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     Flexible(
      //       flex: 3,
      //       child: Container(
      //         color: Colors.blue,
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         color: Colors.red,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
