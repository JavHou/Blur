import 'package:flutter/material.dart';

class RequestVisitStepTwo extends StatefulWidget {
  const RequestVisitStepTwo({super.key});

  @override
  State<RequestVisitStepTwo> createState() => _RequestVisitStepTwoState();
}

class _RequestVisitStepTwoState extends State<RequestVisitStepTwo> {
  bool _isWhatsappSelected = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Select a platform", style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 16,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                onTap: () {
                  setState(() {
                    _isWhatsappSelected = true;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300)
                ),
                contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                title: Text("Whatsapp", style: theme.textTheme.labelMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                leading: Image.network("https://cdn3.iconfinder.com/data/icons/social-network-30/512/social-01-512.png", width: 32, height: 32,),
                subtitle: Text("Recommend", style: theme.textTheme.bodyMedium?.copyWith(color: Colors.blueGrey.shade400)),
                trailing: Checkbox(
                  splashRadius: 20,
                  value: _isWhatsappSelected,
                  onChanged: (value) {},
                ),
              ),
            ),
            SizedBox(height: 12,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                onTap: () {
                  setState(() {
                    _isWhatsappSelected = false;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade300)
                ),
                contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 16),
                title: Text("Google Meet", style: theme.textTheme.labelMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w600)),
                leading: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Google_Meet_icon_%282020%29.svg/512px-Google_Meet_icon_%282020%29.svg.png", width: 32, height: 32,),
                subtitle: Text("Recommend", style: theme.textTheme.bodyMedium?.copyWith(color: Colors.blueGrey.shade400)),
                trailing: Checkbox(
                  splashRadius: 20,
                  value: !_isWhatsappSelected,
                  onChanged: (value) {
                    // setState(() {
                    //   _selectedAddress = 2;
                    // });
                  },
                ),
              ),
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
