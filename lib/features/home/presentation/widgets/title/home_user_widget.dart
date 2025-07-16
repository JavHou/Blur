import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class HomeUserWidget extends StatefulWidget {
  const HomeUserWidget({super.key});

  @override
  State<HomeUserWidget> createState() => _HomeUserWidgetState();
}

class _HomeUserWidgetState extends State<HomeUserWidget> {
  int _selectedAddress = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          builder: (_) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Locations', style: theme.textTheme.labelLarge,),
                leadingWidth: 90,
                leading: CupertinoButton(
                  child: Text("Close", style: theme.textTheme.labelMedium), 
                  onPressed: () {
                  Navigator.of(context).pop();
                }),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: Colors.grey.shade300)
                        ),
                        title: Text("District 10", style: theme.textTheme.titleLarge),
                        subtitle: Text("4517 Washington Ave. Manchester...", style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey.shade700),),
                        leading: HugeIcon(icon: HugeIcons.bulkRoundedLocation01, color: Colors.black, size: 32,),
                        onTap: () => {
                          setState(() {
                              _selectedAddress = 0;
                            })
                        },
                        trailing: Checkbox(
                          splashRadius: 20,
                          value: _selectedAddress == 0,
                          onChanged: (value) => {
                            setState(() {
                              _selectedAddress = 0;
                            })
                          },
                        ),
                      ),
                      SizedBox(height: 8),
                      ListTile(
                        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: Colors.grey.shade300)
                        ),
                        title: Text("District 11", style: theme.textTheme.titleLarge),
                        subtitle: Text("4517 Washington Ave. Manchester...", style: theme.textTheme.titleSmall?.copyWith(color: Colors.grey.shade700),),
                        leading: HugeIcon(icon: HugeIcons.bulkRoundedLocation01, color: Colors.black, size: 32,),
                        onTap: () => {
                          setState(() {
                              _selectedAddress = 1;
                            })
                        },
                        trailing: Checkbox(
                          splashRadius: 20,
                          value: _selectedAddress == 1,
                          onChanged: (value) => {
                            setState(() {
                              _selectedAddress = 1;
                            })
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      FullWidthButton(
                        color: Colors.black,
                        text: "Add new Location", 
                        onPressed: () {}
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
            ),
            child: HugeIcon(icon: HugeIcons.bulkRoundedLocation01, color: Colors.black54),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Kabul, Afghanistan', style: theme.textTheme.labelMedium?.copyWith(letterSpacing: 0, fontWeight: FontWeight.w500)),
                  SizedBox(width: 2),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade700, size: 24,),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
