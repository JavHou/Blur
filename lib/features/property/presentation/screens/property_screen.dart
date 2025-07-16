import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/home/presentation/widgets/category/selectable_category_card.dart';
import 'package:blur/features/property/data/models/property_model.dart';
import 'package:blur/features/property/presentation/screens/property_tour_screen.dart';
import 'package:blur/features/property/presentation/widgets/about/property_about.dart';
import 'package:blur/features/property/presentation/widgets/details/property_details.dart';
import 'package:blur/features/property/presentation/widgets/gallery/property_gallery.dart';
import 'package:blur/features/property/presentation/widgets/host/property_host_info.dart';
import 'package:blur/features/property/presentation/widgets/info/property_info_card.dart';
import 'package:blur/features/property/presentation/widgets/location/property_location.dart';
import 'package:blur/shared/image/image_widget.dart';
import 'package:blur/shared/utils/number/number_utils.dart';
import 'package:share_plus/share_plus.dart';

class PropertyScreen extends StatefulWidget {
  final PropertyModel property;
  const PropertyScreen({super.key, required this.property});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
  final List<Map<String, dynamic>> _features = [
    {"title": 'Swimming Pool', "icon": HugeIcons.bulkRoundedPool, "isSelected": false},
    {"title": 'Wifi', "icon": HugeIcons.bulkRoundedWifi01, "isSelected": false},
    {"title": 'Parking', "icon": HugeIcons.bulkRoundedCarParking01, "isSelected": false},
    {"title": 'Garden', "icon": HugeIcons.bulkRoundedTree01, "isSelected": false},
    {"title": 'Security', "icon": HugeIcons.bulkRoundedSecurity, "isSelected": false},
    {"title": 'Furnished', "icon": HugeIcons.bulkRoundedSofa01, "isSelected": false},
    {"title": 'Fireplace', "icon": HugeIcons.bulkRoundedCampfire, "isSelected": false},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Property Details', style: theme.textTheme.labelLarge),
        actions: [
          IconButton(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedFavourite, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {
              Share.shareUri(
                Uri.parse('https://example.com/property/${widget.property.id}'),
                // subject: 'Check out this property!',
              );
            }, 
            icon: HugeIcon(icon: HugeIcons.strokeRoundedShare05, color: Colors.black)
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  ),
                  onPressed: () {
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
                          height: deviceHeight * 0.5,
                          child: PropertyTourScreen());
                      },
                    );
                    // context.push('/property/tour', extra: widget.property);
                  },
                  label: Text("Schedule Visit", style: theme.textTheme.labelLarge?.copyWith(color: Colors.white)),
                  // icon: HugeIcon(icon: HugeIcons.bulkRoundedShoppingCartAdd01, color: Colors.white),
                ),
              ),
              
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: 200,
                  maxHeight: 400,
                ),
                margin: EdgeInsets.symmetric(horizontal: 16),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: ImageWidget(imageUrl: widget.property.coverImage),
              ),
              SizedBox(height: 12,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(widget.property.title, style: theme.textTheme.labelLarge),
                        Spacer(),
                        Text("\$${formatPrice(widget.property.salePrice!)}", style: theme.textTheme.headlineSmall?.copyWith(color: Colors.green)),
                      ],
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        HugeIcon(icon: HugeIcons.solidRoundedStar, color: Colors.orange, size: 20),
                        SizedBox(width: 4),
                        RichText(
                          text: TextSpan(
                            style: theme.textTheme.labelMedium,
                            children: [
                              TextSpan(text: '4.5 '),
                              TextSpan(
                                text: '(142)',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  fontSize: 16 * 0.8,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    PropertyInfoCard(property: widget.property),
                    SizedBox(height: 16),
                    PropertyAbout(about: widget.property.description),
                    SizedBox(height: 16),
                    PropertyGallery(property: widget.property),
                    SizedBox(height: 16),
                    PropertyLocation(),
                    SizedBox(height: 16),
                    PropertyDetails(),
                    SizedBox(height: 16),
                    Text('Features', style: theme.textTheme.labelLarge),
                    SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                      for (var feature in _features)
                        SelectableCategoryCard(
                          title: feature['title'],
                          icon: feature['icon'],
                          isSelected: feature['isSelected'],
                          onTap: () {
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    PropertyHostInfo(),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
