import 'package:blur/features/dating/presentation/widgets/filter/dating_filter.dart';
import 'package:blur/features/home/presentation/widgets/tabs/match_tab.dart';
import 'package:blur/features/home/presentation/widgets/tabs/meet_tab.dart';
import 'package:blur/features/home/presentation/widgets/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/tabs/discover_tab.dart';

class HomeScreen extends StatefulWidget {
  final bool showFilterOnLoad;
  const HomeScreen({super.key, this.showFilterOnLoad = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int currentTab = 0;

  final tabs = <Widget>[MatchTab(), MeetTab(), ProfileTab()];

  void goToTab(int page) {
    setState(() {
      currentTab = page;
    });

    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    // Show filter popup after registration with 500ms delay
    if (widget.showFilterOnLoad) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(Duration(milliseconds: 500), () {
          _showFilterPopup();
        });
      });
    }
  }

  void _showFilterPopup() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: DatingFilter(),
        );
      },
    );
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
                          ? HugeIcons.duotoneRoundedLink01
                          : HugeIcons.strokeStandardLink01,
                  color:
                      currentTab == 0
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
                      currentTab == 1
                          ? HugeIcons.bulkRoundedCalendar02
                          : HugeIcons.strokeRoundedCalendar02,
                  color:
                      currentTab == 1
                          ? Color(0xFFAB3FFF)
                          : Colors.grey.shade600,
                ),
              ),
              label: "Meet",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2),
                child: HugeIcon(
                  icon:
                      currentTab == 2
                          ? HugeIcons.bulkRoundedUser02
                          : HugeIcons.strokeRoundedUser02,
                  color:
                      currentTab == 2
                          ? Color(0xFFAB3FFF)
                          : Colors.grey.shade600,
                ),
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
