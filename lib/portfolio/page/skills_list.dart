import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'radar_chart_data_fix_min_max.dart';

class SkillsList extends StatelessWidget {
  const SkillsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              '業務、学習を行った上で、今の私のスキルをグラフでまとめました。\n'
              'バックエンドについては、実務にてWebAPIの実装、データ連携処理の開発、プログラムの機能追加や不具合修正などを経験しています。\n'
              '一方で、フロントエンドに関しては、現在ポートフォリオ制作やITパスポートアプリ、ECサイトアプリの作成を通じて、実装を重ねながら理解を深めている段階です。\n'
              'スキルチャートの見方は以下の通りです\n\n'
              '3以上 : 通常使用に問題なし\n'
              '2　　 : 調べながら作業可能\n'
              '1　　 : 自己研鑽\n',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 30),
            LayoutBuilder(
              builder: (context, constraints) {
                bool isWide = constraints.maxWidth > 700; 
                return Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    developmentSkillsRadarChart(),
                    SizedBox(width: isWide ? 100 : 0, height: isWide ? 0 : 50),
                    devopsSkillsRadarChart(),
                  ],
                );
              },
            ),
          ]
        ),
      ),
    );
  }
}

Widget developmentSkillsRadarChart(){
  return SizedBox(
    height: 300,
    width: 300,
    child: RadarChart(
      RadarChartDataFixMinMax(
        max: const RadarEntry(value: 5),
        min: const RadarEntry(value: 1),
        radarShape: RadarShape.polygon,
        tickCount: 4,
        radarBorderData: const BorderSide(color: Colors.grey),
        tickBorderData: BorderSide(width: 1, color: Colors.grey),
        gridBorderData: const BorderSide(width: 1, color: Colors.grey),
        ticksTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 12,  
        ),
        titleTextStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        getTitle: (index, angle) {
          switch (index) {
            case 0:
              return const RadarChartTitle(text: 'Dart(Flutter)');
            case 1:
              return const RadarChartTitle(text: 'C#(.NET)');
            case 2:
              return const RadarChartTitle(text: 'Python(FastAPI)');
            case 3:
              return const RadarChartTitle(text: 'Python(Django)');
            case 4:
              return const RadarChartTitle(text: 'SQLServer');
            default:
              return const RadarChartTitle(text: '');
          }
        },
        dataSets: [
          RadarDataSet(
            borderColor: Colors.green,
            fillColor: Colors.green.withOpacity(0.5),
            dataEntries: const [
              RadarEntry(value: 1), // Dart(Flutter)
              RadarEntry(value: 3), // C#(.NET)
              RadarEntry(value: 2), // Python(FastAPI)
              RadarEntry(value: 2), // Python(Django)
              RadarEntry(value: 3), // SQLServer
            ],
          ),
        ],
      ),
    ),
  );
}

  Widget devopsSkillsRadarChart(){
    return SizedBox(
      height: 300,
      width: 300,
      child: RadarChart(
        RadarChartDataFixMinMax(
          max: const RadarEntry(value: 5),
          min: const RadarEntry(value: 1),
          radarShape: RadarShape.polygon,
          tickCount: 4,
          radarBorderData: const BorderSide(color: Colors.grey),
          tickBorderData: BorderSide(width: 1, color: Colors.grey),
          gridBorderData: const BorderSide(width: 1, color: Colors.grey),
          ticksTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 12,  
          ),
          titleTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          getTitle: (index, angle) {
            switch (index) {
              case 0:
                return const RadarChartTitle(text: 'SVN');
              case 1:
                return const RadarChartTitle(text: 'GitHub');
              case 2:
                return const RadarChartTitle(text: 'Docker');
              case 3:
                return const RadarChartTitle(text: 'PowerShell');
              case 4:
                return const RadarChartTitle(text: 'JobCenter');
              default:
                return const RadarChartTitle(text: '');
            }
          },
          dataSets: [
            RadarDataSet(
              borderColor: Colors.green,
              fillColor: Colors.green.withOpacity(0.5),
              dataEntries: const [
                RadarEntry(value: 2),
                RadarEntry(value: 3),
                RadarEntry(value: 2),
                RadarEntry(value: 3),
                RadarEntry(value: 3),
              ],
            ),
          ],
        ),
      ),
    );
  }