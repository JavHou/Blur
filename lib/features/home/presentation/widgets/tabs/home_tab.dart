import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/category/category_card.dart';
import 'package:blur/features/home/presentation/widgets/title/home_user_widget.dart';
import 'package:blur/features/property/data/models/property_model.dart';
import 'package:blur/features/property/presentation/widgets/card/horizontal_property_card.dart';
import 'package:blur/features/property/presentation/widgets/list/vertical_popular_properties.dart';
import 'package:blur/shared/actions/title_action.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: HomeUserWidget(),
        actions: [
          IconButton(
            onPressed: () {
              context.push("/notifications");
            },
            icon: HugeIcon(icon: HugeIcons.bulkRoundedNotification01, color: Colors.black),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 16),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TitleAction(
                      title: 'Featured Properties', 
                      onTap: () {
                        context.push("/properties");
                      }
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: properties.length,
                      padding: EdgeInsets.only(left: 16),
                      itemBuilder: (context, index) {
                        return AspectRatio(
                          aspectRatio: 1.2,
                          child: Container(
                            margin: EdgeInsets.only(right: 12),
                            child: HorizontalPropertyCard(property: properties.reversed.toList()[index],),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        TitleAction(title: "Categories"),
                        SizedBox(height: 12,),
                        categories(),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  context.push("/categories");
                                }, 
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                                  overlayColor: WidgetStatePropertyAll(Colors.grey.shade200.withAlpha(100)),
                                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(16)
                                  )),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Explore Categories", style: theme.textTheme.titleMedium?.copyWith(color: Colors.black87),),
                                    SizedBox(width: 4),
                                    Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 14),
                                  ],
                                ),
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        TitleAction(
                          title: 'Popular Properties', 
                          onTap: () {
                            context.push("/properties");
                          }
                        ),
                        SizedBox(height: 12),
                        VerticalPopularProperties(),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categories() {
    return Row(
      children: [
        Expanded(
          child: CategoryCard(
            title: "Apartment", 
            color: Colors.orange.shade800,
            icon: HugeIcons.bulkRoundedBuilding06,
            onPressed: () {
              context.push(
                '/categories/1/view',
              );
            },
          ),
        ),
        SizedBox(width: 12,),
        Expanded(
          child: CategoryCard(
            title: "House",
            color: Colors.deepPurple,
            icon: HugeIcons.bulkRoundedHome01, 
            onPressed: () {
              context.push(
                '/categories/2/view',
              );
            },
          ),
        ),
        SizedBox(width: 12,),
        Expanded(
          child: CategoryCard(
            title: "Yard", 
            color: Colors.green.shade800,
            icon: HugeIcons.bulkRoundedTree01,
            onPressed: () {
              context.push(
                '/categories/3/view',
              );
            },
          ),
        ),
        SizedBox(width: 12,),
        Expanded(
          child: CategoryCard(
            title: "Land", 
            color: Colors.red.shade800,
            icon: HugeIcons.bulkRoundedDashboardCircleAdd,
            onPressed: () {
              context.push(
                '/categories/4/view',
              );
            },
          ),
        ),
      ],
    );
  }
}
