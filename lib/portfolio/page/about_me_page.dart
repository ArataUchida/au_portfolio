import 'package:flutter/material.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(40),
          constraints: const BoxConstraints(maxWidth: 1000), 
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'about me',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
  
              LayoutBuilder(
                builder: (context, constraints) {
                  bool isWide = constraints.maxWidth > 700;
                  return Flex(
                    direction: isWide ? Axis.horizontal : Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          'assets/あずき.jpg',
                          fit: BoxFit.cover,
                          width: isWide ? 200 : double.infinity,
                          height: 200,
                        ),
                      ),
                      SizedBox(width: isWide ? 50 : 0, height: isWide ? 0 : 20),
                      const Text(
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
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}