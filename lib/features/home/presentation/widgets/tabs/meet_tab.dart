import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:flutter/material.dart';
import 'package:blur/features/meet/presentation/widgets/card/meet_card.dart';

class MeetTab extends StatefulWidget {
  const MeetTab({super.key});

  @override
  State<MeetTab> createState() => _MeetTabState();
}

class _MeetTabState extends State<MeetTab> with SingleTickerProviderStateMixin {
  List<DatingModel> get upcomingDatings =>
      datings.where((d) => d.status == DatingStatus.upcoming).toList();
  List<DatingModel> get pastDatings =>
      datings.where((d) => d.status == DatingStatus.past).toList();
  List<DatingModel> get canceledDatings =>
      datings.where((d) => d.status == DatingStatus.canceled).toList();

  String getStatusLabel(DatingModel dating) {
    switch (dating.status) {
      case DatingStatus.upcoming:
        return "🗓️ 添加到日历";
      case DatingStatus.past:
        return "✅ 已完成";
      case DatingStatus.canceled:
        return "❌ 已取消";
      default:
        return "⏱️ Pending";
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Booking Tab', style: theme.textTheme.labelLarge,),
        // ),
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(16),
            child: Container(
              height: 58,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey.shade100,
              ),
              child: TabBar(
                splashFactory: NoSplash.splashFactory,
                // padding: EdgeInsets.all(0),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(52),
                  color: Colors.white,
                ),
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                // labelPadding: EdgeInsets.symmetric(horizontal: 16),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.shade600,
                labelStyle: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("即将到来")],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("已完成")],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("已取消")],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  children:
                      upcomingDatings
                          .map(
                            (dating) => Column(
                              children: [
                                MeetCard(
                                  dating: dating,
                                  status: getStatusLabel(dating),
                                ),
                                SizedBox(height: 12),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  children:
                      pastDatings
                          .map(
                            (dating) => Column(
                              children: [
                                MeetCard(
                                  dating: dating,
                                  status: getStatusLabel(dating),
                                ),
                                SizedBox(height: 12),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  children:
                      canceledDatings
                          .map(
                            (dating) => Column(
                              children: [
                                MeetCard(
                                  dating: dating,
                                  status: getStatusLabel(dating),
                                ),
                                SizedBox(height: 12),
                              ],
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
