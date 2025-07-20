import 'package:blur/features/home/presentation/widgets/tabs/match_tab.dart';
import 'package:blur/features/home/presentation/widgets/tabs/meet_tab.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/tabs/discover_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int currentTab = 1;

  final tabs = <Widget>[DiscoverTab(), MatchTab(), MeetTab()];

  void goToTab(int page) {
    setState(() {
      currentTab = page;
    });

    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            currentTab = page;
          });
        },
        children: tabs,
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          onTap: goToTab,
          currentIndex: currentTab,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey.shade700,
          selectedLabelStyle: theme.textTheme.labelMedium?.copyWith(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: theme.textTheme.labelMedium?.copyWith(
            color: Colors.grey.shade700,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2),
                child: HugeIcon(
                  icon:
                      currentTab == 0
                          ? HugeIcons.bulkRoundedDiscoverCircle
                          : HugeIcons.strokeRoundedDiscoverCircle,
                  color:
                      currentTab == 0
                          ? Color(0xFFAB3FFF)
                          : Colors.grey.shade600,
                ),
              ),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2),
                child: HugeIcon(
                  icon:
                      currentTab == 1
                          ? HugeIcons.duotoneRoundedLink01
                          : HugeIcons.strokeStandardLink01,
                  color:
                      currentTab == 1
                          ? Color(0xFFAB3FFF)
                          : Colors.grey.shade600,
                ),
              ),
              label: "Match!",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2),
                child: HugeIcon(
                  icon:
                      currentTab == 2
                          ? HugeIcons.bulkRoundedCalendar02
                          : HugeIcons.strokeRoundedCalendar02,
                  color:
                      currentTab == 2
                          ? Color(0xFFAB3FFF)
                          : Colors.grey.shade600,
                ),
              ),
              label: "Meet",
            ),
          ],
        ),
      ),
    );
  }
}
