//import 'package:flutter/material.dart';
//
//class StartPage extends StatelessWidget{
//  const StartPage({super.key});
//
//  @override
//  Widget build(BuildContext context){
//    return Scaffold(
//      backgroundColor: Colors.blueAccent,
//      body:SingleChildScrollView(
//        padding: EdgeInsets.all(10),
//        child: Center(
//          child: Container(
//            padding: EdgeInsets.all(12),
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              children: [
//                Text('Welcome to my portfolio！', 
//                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
//                ),
//                Container(
//                  color: Colors.blue,
//                    child: Image.asset(
//                    'assets/三毛猫イラスト.png',
//                    width: 200,
//                    height: 200,
//                    fit: BoxFit.cover,
//                  ),
//                )
//              ],
//            ),
//          ),
//        ),
//      )
//    );
//  }
//}

import 'dart:async';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final List<String> _backgroundImages = [
    'assets/あずき.jpg',
    'assets/三毛猫イラスト.png',
  ];

  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _backgroundImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 背景画像切り替え
        AnimatedSwitcher(
          duration: Duration(seconds: 1),
          child: Image.asset(
            _backgroundImages[_currentIndex],
            key: ValueKey(_backgroundImages[_currentIndex]),
            fit: BoxFit.contain, 
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center, 
          ),
        ),
        // コンテンツ
        SingleChildScrollView(
          padding: EdgeInsets.all(100),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Welcome to my portfolio！',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.all(8),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}