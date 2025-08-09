import 'package:flutter/material.dart';

class EndPage extends StatelessWidget{
  const EndPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(80),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Thank you for visiting!', 
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}