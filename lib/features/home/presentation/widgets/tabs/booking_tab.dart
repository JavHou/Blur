import 'package:flutter/material.dart';
import 'package:blur/features/booking/presentation/widgets/card/booking_card.dart';
import 'package:blur/features/property/data/models/property_model.dart';

class BookingTab extends StatefulWidget {
  const BookingTab({super.key});

  @override
  State<BookingTab> createState() => _BookingTabState();
}

class _BookingTabState extends State<BookingTab> with SingleTickerProviderStateMixin {

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
                color: Colors.grey.shade100
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
                labelStyle: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Upcoming",),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Past",),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Canceled",),
                      ],
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
                  children: [
                    BookingCard(property: properties.last, status: "🗓️ In 2 weeks",),
                    SizedBox(height: 12,),
                    BookingCard(property: properties[2], status: "⏱️ Pending",),
                    SizedBox(height: 12,),
                    BookingCard(property: properties.first, status: "⏱️ Pending",),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  BookingCard(property: properties[1], status: "✅ Finished",),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: [
                  BookingCard(property: properties.last, status: "❌ Cancel on 28 November 2024",),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
