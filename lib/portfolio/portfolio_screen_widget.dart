//import 'package:flutter/material.dart';
//import 'package:portfolio/portfolio/page/start_page.dart';
//import 'package:portfolio/portfolio/page/about_site_page.dart';
//import 'package:portfolio/portfolio/page/about_me_page.dart';
//import 'package:portfolio/portfolio/page/projects_page.dart';
//import 'package:portfolio/portfolio/page/skills_list.dart';
//import 'package:portfolio/portfolio/page/profile_page.dart';
//import 'package:portfolio/portfolio/page/goals_page.dart';
//import 'package:portfolio/portfolio/page/contact_page.dart';
//import 'package:portfolio/portfolio/page/end_page.dart';
//
//class PortfolioScreenWidget extends StatefulWidget {
//  const PortfolioScreenWidget({super.key});
//
//  @override
//  State<PortfolioScreenWidget> createState() => _PortfolioScreenState();
//}
//
//class _PortfolioScreenState extends State<PortfolioScreenWidget> with TickerProviderStateMixin {
//  late TabController _tabController;
//  late PageController _pageController;
//
//  final List<Widget> pages = const [
//    StartPage(),
//    AboutSitePage(),
//    AboutMePage(),
//    ProjectsPage(),
//    SkillsList(),
//    ProfilePage(),
//    GoalsPage(),
//    ContactPage(),
//    EndPage(),
//  ];
//
//  @override
//  void initState() {
//    super.initState();
//    _tabController = TabController(length: pages.length, vsync: this);
//    _pageController = PageController();
//
//    _pageController.addListener(() {
//      final pageIndex = _pageController.page?.round();
//      if (pageIndex != null && pageIndex != _tabController.index) {
//        _tabController.index = pageIndex;
//      }
//    });
//  }
//
//  @override
//  void dispose() {
//    _tabController.dispose();
//    _pageController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.white,
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        elevation: 0,
//        bottom: TabBar(
//          controller: _tabController,
//          isScrollable: true,
//          labelColor: Colors.black,
//          tabs: const [
//            Tab(text: '始めに'),
//            Tab(text: 'サイトについて'),
//            Tab(text: 'About Me'),
//            Tab(text: '成果物一覧'),
//            Tab(text: 'スキル一覧'),
//            Tab(text: 'プロフィール'),
//            Tab(text: '今後の目標'),
//            Tab(text: '連絡'),
//            Tab(text: '終わりに'),
//          ],
//          onTap: (index) {
//            _pageController.animateToPage(index,duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
//          },
//        ),
//      ),
//      body: PageView(
//        controller: _pageController,
//        scrollDirection: Axis.vertical,
//        children: pages,
//      ),
//    );
//  }
//}
//
import 'package:flutter/material.dart';
import 'package:portfolio/portfolio/page/start_page.dart';
import 'package:portfolio/portfolio/page/about_site_page.dart';
import 'package:portfolio/portfolio/page/about_me_page.dart';
import 'package:portfolio/portfolio/page/projects_page.dart';
import 'package:portfolio/portfolio/page/skills_list.dart';
import 'package:portfolio/portfolio/page/profile_page.dart';
import 'package:portfolio/portfolio/page/goals_page.dart';
import 'package:portfolio/portfolio/page/contact_page.dart';
import 'package:portfolio/portfolio/page/end_page.dart';

class PortfolioScreenWidget extends StatefulWidget {
  const PortfolioScreenWidget({super.key});

  @override
  State<PortfolioScreenWidget> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreenWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  // 各セクションの GlobalKey
  final List<GlobalKey> _sectionKeys = List.generate(9, (_) => GlobalKey());

  final List<Widget> pages = const [
    StartPage(),
    AboutSitePage(),
    AboutMePage(),
    ProjectsPage(),
    SkillsList(),
    ProfilePage(),
    GoalsPage(),
    ContactPage(),
    EndPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: pages.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final keyContext = _sectionKeys[index].currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black, // 未選択ラベルも黒
          indicatorColor: Colors.transparent, // 下線インジケータを非表示
          tabs: const [
            Tab(text: '始めに'),
            Tab(text: 'サイトについて'),
            Tab(text: 'About Me'),
            Tab(text: '成果物一覧'),
            Tab(text: 'スキル一覧'),
            Tab(text: 'プロフィール'),
            Tab(text: '今後の目標'),
            Tab(text: '連絡'),
            Tab(text: '終わりに'),
          ],
          onTap: _scrollToSection,
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: List.generate(
            pages.length,
            (index) => Container(
              key: _sectionKeys[index],
              width: double.infinity,
              child: pages[index],
            ),
          ),
        ),
      ),
    );
  }
}
