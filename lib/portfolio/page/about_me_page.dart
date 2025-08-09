import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget{
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(80),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('about me',
                style: TextStyle(
                  fontSize: 50, 
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image(
                      image: AssetImage('assets/あずき.jpg'),
                      fit: BoxFit.cover,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(width: 50),
                  Expanded(
                    child: Text(
                      '埼玉県出身のエンジニアです。\n'
                      '整体師、電気施工管理技士として働く中でプログラミングに興味を持ち、28歳でIT業界に転身しました。\n'
                      '現在まで、ユーザ管理、システムの運用管理やデータ連携機能の担当機能の詳細設計〜プログラムのリリースなどを経験しました。\n'
                      '未経験からのスタートでしたが、分からないことはまず自分で調べ、調査しても解決できなかった場合は調べた内容を整理した上で相談するなど、'
                      '主体性な行動を大切にしながらスキルアップを続けています。\n'
                      '趣味はブラジリアン柔術や空道などの格闘技、お庭いじり、そして猫とのんびり過ごすことです。\n'
                      '“まずはやってみる”精神と、最後までやり切る責任感を武器に、これからもエンジニアとして成長を続けていきたいと考えています。',
                      style: TextStyle(
                        fontSize: 16, 
                        color: Colors.black,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}