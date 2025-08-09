import 'package:flutter/material.dart';
//import 'dart:html' as html; //Flutter Web用。
import 'package:portfolio/portfolio/portfolio_screen_widget.dart';
void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData.dark(useMaterial3: true),
      home: const PortfolioScreenWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
