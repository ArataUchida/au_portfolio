import 'package:flutter/material.dart';
import 'package:portfolio/portfolio/section_title_widget.dart';
import 'package:portfolio/portfolio/deliverables_card_widget.dart';

class ProjectsPage extends StatelessWidget{
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SectionTitleWidget(title: '成果物の紹介'),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  DeliverablesCardWidget(
                    title: 'CSVファイル出力デスクトップアプリ',
                    description: 'C# .NET Frameworkで構築したアプリ。対象情報入力してボタン押下時にCSVファイル出力',
                    githubUrl: 'https://github.com/ArataUchida/cyber_setState/blob/main/lib/feature/product_page/product_widget.dart',//C#のアプリをGitHubにPush
                  ),
                  DeliverablesCardWidget(
                    title: 'ITパスポートアプリ',
                    description: 'Dart(Flutter)で構築した資格取得学習アプリ。',
                    githubUrl: 'https://github.com/ArataUchida/it_passport_training_app',
                  ),
                  DeliverablesCardWidget(
                    title: 'E-Commerce App',
                    description: 'FlutterとRiverpodで構築したショッピングアプリ。',
                    githubUrl: 'https://github.com/ArataUchida/cyber',
                  ),
                  DeliverablesCardWidget(
                    title: 'Portfolio Site',
                    description: 'このポートフォリオ自体をFlutter Webで構築。',
                    githubUrl: 'https://github.com/ArataUchida/cyber_setState',//ポートフォーリオをデプロイ後URLを変更
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        )
      ),
    );
  }
}