import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:blur/shared/buttons/full_width_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHJlYWxzdGF0ZXxlbnwwfHwwfHx8MA%3D%3D",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Text(
                      "Welcome to blur",
                      style: theme.textTheme.headlineMedium,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Discover a place you'll love to live",
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: Colors.grey.shade700,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: FullWidthButton(
                            text: "Login",
                            onPressed: () {
                              context.push("/login");
                            },
                            radius: 52,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              context.push("/register");
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.white,
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(52),
                                  side: BorderSide(color: Colors.grey.shade300),
                                ),
                              ),
                            ),
                            child: Text(
                              "Register",
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
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
                                      side: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
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
                                      side: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
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
                                      side: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
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
