import 'package:flutter/material.dart';
import 'package:practica3/dashboard_screen.dart';
import 'package:practica3/onboarding_screen.dart';
import 'package:practica3/providers/provider_theme.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme.getThemeData(),
      home: const OnboardingScreen(),
      routes: {
        '/dash': (BuildContext context) => DashboardScreen(),
      },
    );
  }
}
