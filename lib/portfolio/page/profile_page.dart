import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class YearlyProfile {
  final String year;
  final String description;
  YearlyProfile(this.year, this.description);
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<YearlyProfile> profiles = [
    YearlyProfile('2016', '整体師としてキャリアをスタートしてお客様の体の不調を聞き出し要望にお答えしてお体の改善に努めました。',),
    YearlyProfile('2018', '電気工事建築施工管理として現場を統括。事務所棟や市役所などの公共施設で現場代理人を務め、他業種との調整・連携を通じて、安全・品質・工程管理を実践しました。'),
    YearlyProfile('2023', '新築工事や改修工事に携わっておりましたが、次第に業務の中心が保守・保安業務へと移行していき、自身のキャリアとの方向性に疑問を感じるようになりました。\n'
    'そのような中、友人宅で簡単なプログラミング操作を体験する機会がありました。\n'
    '何も分からない中で自分なりに調べながら問題を解決できたことに楽しさを感じ、また、ロジックを組み立てて動作させる面白さにも惹かれ、プログラミングに強い関心を抱くようになりました。'
    ),
    YearlyProfile('2023\n10月', 'エンジニアになることを決意して、エンジニアとして働いている友人からPythonを学びました。'),
    YearlyProfile('2024', 'エンジニアへ未経験で転職し、開発、運用の業務を務めました。'),
    YearlyProfile('現在', 'Flutterを使用して開発経験のあるエンジニアの方から指導を受けたことをきっかけに、UI表現の柔軟さやクロスプラットフォーム対応の利便性に魅力を感じました。\n以降も業後の時間を利用してご指導をいただきながら、Flutterを用いたアプリ制作の学習を継続しています。'),
  ];

  final Set<int> visibleIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '経歴 / ストーリー',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 20),
        const Text(
          '整体師 → 施工管理 → エンジニアという異業種転職。\n'
          '現場で鍛えた課題発見力と改善意識をエンジニアリングに活かしています。\n'
          '人の課題を解決する「仕組み」を作りたいと考え、現在に至ります。',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black87, fontSize: 16),
        ),
        const SizedBox(height: 40),

        // 年ごとのプロフィールを表示
        ...List.generate(profiles.length, (index) {
          final profile = profiles[index];
          final isVisible = visibleIndexes.contains(index);

          return VisibilityDetector(
            key: Key('year-profile-$index'),
            onVisibilityChanged: (info) {
              if (info.visibleFraction > 0.8 && !visibleIndexes.contains(index)) {
                setState(() {
                  visibleIndexes.add(index);
                });
              }
            },
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 600),
              offset: isVisible ? Offset.zero : const Offset(1.5, 0),
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                opacity: isVisible ? 1.0 : 0.0,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        profile.year,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                      fit: FlexFit.loose,
                        child: Text(
                          profile.description,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
        const SizedBox(height: 60),
      ],
    );
  }
}