import 'package:blur/shared/logo_fonts/title_fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/inputs/base_input.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:blur/features/abstraxion/presentation/abstraxion_screen.dart';

class LoginScreen extends StatefulWidget {
  final String? authCallbackGranted;
  final String? authCallbackGranter;

  const LoginScreen({
    super.key,
    this.authCallbackGranted,
    this.authCallbackGranter,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: deviceHeight * 0.89,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 128),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(child: TitleFont(title: 'Blur', fontSize: 64)),
                    SizedBox(height: 80),
                    BaseInput(hint: "Email"),
                    SizedBox(height: 16),
                    // Column(
                    //   children: [
                    //     BaseInput(hint: "Password", obscureText: true),
                    //     Align(
                    //       alignment: Alignment.centerRight,
                    //       child: InkWell(
                    //         onTap: () {
                    //           context.push("/forgot-password");
                    //         },
                    //         child: Padding(
                    //           padding: const EdgeInsets.symmetric(
                    //             vertical: 8.0,
                    //           ),
                    //           child: Text(
                    //             "忘记密码？",
                    //             style: theme.textTheme.titleSmall?.copyWith(
                    //               color: Colors.blue.shade700,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 16),

                    // Opacity(
                    //   opacity: _isBlockchainAuthenticating ? 0.5 : 1.0,
                    //   child: FullWidthButton(
                    //     text: "登录",
                    //     onPressed: () {
                    //       if (!_isBlockchainAuthenticating) {
                    //         context.go('/home?showFilter=false');
                    //       }
                    //     },
                    //   ),
                    // ),
                    // SizedBox(height: 16),
                    FullWidthButton(
                      text: "Xion登录",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AbstraxionScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Column(
                  children: [
                    Text(
                      "其他方式",
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: Colors.grey.shade700,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Container(
                        //   child: IconButton(
                        //     style: ButtonStyle(
                        //       shape: WidgetStatePropertyAll(
                        //         RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(12),
                        //           side: BorderSide(
                        //             color: Colors.grey.shade100,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     onPressed:
                        //         _isBlockchainAuthenticating ? null : () {},
                        //     icon: HugeIcon(
                        //       icon: HugeIcons.strokeRoundedWechat,
                        //       color: Colors.grey.shade700,
                        //       size: 28,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 8),
                        Container(
                          child: IconButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.grey.shade100),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            icon: HugeIcon(
                              icon: HugeIcons.strokeRoundedApple,
                              color: Colors.grey.shade700,
                              size: 28,
                            ),
                            // icon: Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Image.network(
                            //       "https://cdn.freebiesupply.com/logos/large/2x/facebook-logo-2019.png",
                            //       width: 28,
                            //       height: 28,
                            //     ),
                            //   ],
                            // ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: IconButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.grey.shade100),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            icon: HugeIcon(
                              icon: HugeIcons.strokeRoundedGoogle,
                              color: Colors.grey.shade700,
                              size: 28,
                            ),
                          ),
                          //   icon: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Image.network(
                          //         "https://cdn-icons-png.flaticon.com/512/0/747.png",
                          //         width: 28,
                          //         height: 28,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "没有账号？ ",
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: Colors.grey.shade700,
                        letterSpacing: 0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.push("/register");
                      },
                      child: Text(
                        "立即注册",
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
