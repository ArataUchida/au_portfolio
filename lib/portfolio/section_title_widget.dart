import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  const SectionTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,style: const TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold, 
            color: Colors.black,
          )
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}