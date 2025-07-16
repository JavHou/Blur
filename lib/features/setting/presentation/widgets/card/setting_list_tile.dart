import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SettingListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final HugeIconData? icon;
  final Function onTap;
  final String? value;
  final bool? isLast;
  final bool? isFirst;
  final Color? color;

  const SettingListTile({super.key, required this.title, this.subtitle, this.icon, required this.onTap, this.value, this.isFirst, this.isLast, this.color}) : super();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ListTile(
      onTap: () => onTap(),
      shape: RoundedRectangleBorder(
        borderRadius: isFirst != null && isFirst! ? BorderRadius.only(
          topLeft: Radius.circular(12), 
          topRight: Radius.circular(12)
        ) : isLast != null && isLast! ? BorderRadius.only(
          bottomLeft: Radius.circular(12), 
          bottomRight: Radius.circular(12)
        ) : BorderRadius.zero,
      ),
      contentPadding: EdgeInsets.only(left: 12, right: 12),
      leading: icon != null ? HugeIcon(icon: icon, color: color != null ? color! : Colors.black, size: 24) : null,
      title: Text(title, style: theme.textTheme.labelMedium?.copyWith(letterSpacing: 0, color: color != null ? color! : Colors.black)),
      trailing: value != null ? SizedBox(
        width: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(value!, style: theme.textTheme.labelMedium?.copyWith(color: Colors.blueGrey.shade700, letterSpacing: 0)),
            SizedBox(width: 8,),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blueGrey.shade700),
          ],
        ),                        
      ) : Icon(Icons.arrow_forward_ios, size: 16, color: Colors.blueGrey.shade700),
    );
  }
}
