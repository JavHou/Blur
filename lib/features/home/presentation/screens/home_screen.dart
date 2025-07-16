import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/tabs/booking_tab.dart';
import 'package:blur/features/home/presentation/widgets/tabs/conversation_tab.dart';
import 'package:blur/features/home/presentation/widgets/tabs/discover_tab.dart';
import 'package:blur/features/home/presentation/widgets/tabs/home_tab.dart';
import 'package:blur/features/home/presentation/widgets/tabs/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int currentTab = 0;

  final tabs = <Widget>[
    HomeTab(),
    DiscoverTab(),
    BookingTab(),
    // ConversationTab(),
    // ProfileTab(),
  ];

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
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: tabs,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            currentTab = page;
          });
        },
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
                          ? HugeIcons.bulkRoundedHome05
                          : HugeIcons.strokeRoundedHome05,
                  color: currentTab == 0 ? Colors.black : Colors.grey.shade600,
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2),
                child: HugeIcon(
                  icon:
                      currentTab == 1
                          ? HugeIcons.bulkRoundedDiscoverCircle
                          : HugeIcons.strokeRoundedDiscoverCircle,
                  color: currentTab == 1 ? Colors.black : Colors.grey.shade600,
                ),
              ),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 2),
                child: HugeIcon(
                  icon:
                      currentTab == 2
                          ? HugeIcons.bulkRoundedCalendar02
                          : HugeIcons.strokeRoundedCalendar02,
                  color: currentTab == 2 ? Colors.black : Colors.grey.shade600,
                ),
              ),
              label: "Booking",
            ),
            // BottomNavigationBarItem(
            //   icon: Container(
            //     margin: EdgeInsets.only(bottom: 2),
            //     child: HugeIcon(
            //       icon:
            //           currentTab == 3
            //               ? HugeIcons.bulkRoundedMessage01
            //               : HugeIcons.strokeRoundedMessage01,
            //       color: currentTab == 3 ? Colors.black : Colors.grey.shade600,
            //     ),
            //   ),
            //   label: "Message",
            // ),
            // BottomNavigationBarItem(
            //   icon: Container(
            //     margin: EdgeInsets.only(bottom: 2),
            //     child: HugeIcon(
            //       icon:
            //           currentTab == 4
            //               ? HugeIcons.bulkRoundedUser
            //               : HugeIcons.strokeRoundedUser,
            //       color: currentTab == 4 ? Colors.black : Colors.grey.shade600,
            //     ),
            //   ),
            //   label: "Profile",
            // ),
          ],
        ),
      ),
    );
  }
}
