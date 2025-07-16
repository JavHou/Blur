import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';
import 'package:blur/shared/inputs/base_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
                SizedBox(height: 42),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Let\'s Get You Signed In ',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Please enter your login info to continue.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey.shade700,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 32),
                    BaseInput(label: "Email", hint: "e.g. rto1680@gmail.com"),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        BaseInput(
                          label: "Password",
                          hint: "Password",
                          obscureText: true,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              context.push("/forgot-password");
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                "Forgot Password?",
                                style: theme.textTheme.titleSmall?.copyWith(
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    FullWidthButton(
                      text: "Login",
                      onPressed: () {
                        context.go("/home");
                      },
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Column(
                  children: [
                    Text(
                      "or Continue with",
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: Colors.grey.shade700,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: IconButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png",
                                  width: 28,
                                  height: 28,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Continue with Google",
                                  style: theme.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: IconButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  "https://cdn.freebiesupply.com/logos/large/2x/facebook-logo-2019.png",
                                  width: 24,
                                  height: 24,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Continue with Facebook",
                                  style: theme.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: IconButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  "https://cdn-icons-png.flaticon.com/512/0/747.png",
                                  width: 28,
                                  height: 28,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Continue with Apple",
                                  style: theme.textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
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
                      "Don't have an account yet? ",
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
                        "Register",
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
