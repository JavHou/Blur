import 'package:blur/features/dating/data/models/dating_model.dart';
import 'package:blur/features/dating/presentation/screens/dating_confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:blur/features/meet/presentation/widgets/card/meet_card.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/utils/localization_helper.dart';

class MeetTab extends StatefulWidget {
  const MeetTab({super.key});

  @override
  State<MeetTab> createState() => MeetTabState();
}

class MeetTabState extends State<MeetTab> with SingleTickerProviderStateMixin {
  // Add static callback for global refresh
  static Function()? globalRefreshCallback;

  List<DatingModel> _datings = datings; // Create local state copy

  List<DatingModel> get upcomingDatings =>
      _datings.where((d) => d.status == DatingStatus.upcoming).toList();
  List<DatingModel> get pastDatings =>
      _datings.where((d) => d.status == DatingStatus.past).toList();
  List<DatingModel> get canceledDatings =>
      _datings.where((d) => d.status == DatingStatus.canceled).toList();

  void _updateDating(DatingModel updatedDating) {
    setState(() {
      final index = _datings.indexWhere((d) => d.id == updatedDating.id);
      if (index != -1) {
        _datings[index] = updatedDating;
      }
    });
  }

  void _refreshDatings() {
    print('=== MeetTab _refreshDatings called ===');
    if (mounted) {
      setState(() {
        // Create a new list from global datings to trigger rebuild
        _datings = List<DatingModel>.from(datings);
        print('Updated _datings count: ${_datings.length}');
        print('Upcoming datings count: ${upcomingDatings.length}');
      });
    } else {
      print('WARNING: MeetTab is not mounted, skipping setState');
    }
  }

  void _navigateToConfirm(DatingModel dating) async {
    final result = await context.push(
      '/dating/${dating.id}/confirm',
      extra: {'dating': dating, 'onUpdate': _updateDating},
    );

    // Additional refresh if needed
    if (result != null) {
      _refreshDatings();
    }
  }

  String getStatusLabel(DatingModel dating) {
    switch (dating.status) {
      case DatingStatus.upcoming:
        return context.l10n.addToCalendar;
      case DatingStatus.past:
        return context.l10n.completed;
      case DatingStatus.canceled:
        return "❌ ${context.l10n.canceled}";
      default:
        return context.l10n.pending;
    }
  }

  @override
  void initState() {
    super.initState();
    print('=== MeetTab initState: Setting globalRefreshCallback ===');
    print(
      'Current globalRefreshCallback before setting: ${globalRefreshCallback != null}',
    );
    // Set global refresh callback
    globalRefreshCallback = _refreshDatings;
    print('globalRefreshCallback set to: ${globalRefreshCallback != null}');
  }

  @override
  void dispose() {
    print('=== MeetTab dispose: Clearing globalRefreshCallback ===');
    print('Current globalRefreshCallback: ${globalRefreshCallback != null}');
    // Clear global callback when disposing
    if (globalRefreshCallback == _refreshDatings) {
      globalRefreshCallback = null;
      print('Cleared globalRefreshCallback');
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(52),
                  color: Colors.white,
                ),
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
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
                      children: [Text(context.l10n.upcoming)],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(context.l10n.past)],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(context.l10n.canceled)],
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
                                GestureDetector(
                                  onTap: () => _navigateToConfirm(dating),
                                  child: MeetCard(
                                    dating: dating,
                                    status: getStatusLabel(dating),
                                  ),
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
