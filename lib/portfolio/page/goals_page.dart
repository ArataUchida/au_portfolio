import 'package:flutter/material.dart';
import 'package:portfolio/portfolio/section_title_widget.dart';

class GoalsPage extends StatelessWidget{
  const GoalsPage ({super.key});

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(100),
          child: Column(
            
            mainAxisSize: MainAxisSize.min,
            children: [
              const SectionTitleWidget(title: '今後の目標'),
              const Text(
                '今後は、フロントエンドからバックエンドまで一通り担えるエンジニアを目指しています。\n'
                '業務ではC#.NET、PowerShell、Pythonによるバックエンド開発を経験し、個人開発では、Dart Flutterにより、スマートフォンアプリの開発やGitHubを活用して継続的な学習のアウトプットに取り組んでいます。\n'
                'こうした経験を活かし、中小企業向けの業務アプリや個人開発アプリ、スタートアップでのスピード感ある開発にも対応できる力を身につけていきたいと考えています。\n'
                '技術の幅を広げるだけでなく、実務を通じて業務理解力も高め、開発現場に実装以上の価値を提供できるエンジニアを目指していきます。',
                style: TextStyle(
                  fontSize: 16, 
                  color: Colors.black,
                  height: 1.6,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}