import 'package:flutter/material.dart';

class AboutSitePage extends StatelessWidget{
  const AboutSitePage({super.key});

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(80),
        child: Column(
        mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'about This Site',
              style: TextStyle(
                fontSize: 50, 
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            Text(
              'A.U Portfolio Siteにお越しくださり、ありがとうございます。\n'
              '本サイトでは、過去の制作物や身につけたスキルをご紹介しています。\n'
              'エンジニアとしての私だけでなく、一人の人間としての想いや歩みも伝われば嬉しく思います。\n'
              'ご覧いただけますと幸いです。',
              style: TextStyle(
                fontSize: 20, 
                height: 1.5,
                color: Colors.black
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}