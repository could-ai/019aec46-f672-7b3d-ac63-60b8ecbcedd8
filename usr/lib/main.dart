import 'package:flutter/material.dart';
import 'package:couldai_user_app/core/theme.dart';
import 'package:couldai_user_app/screens/auth/login_screen.dart';
import 'package:couldai_user_app/screens/auth/seller_register_screen.dart';
import 'package:couldai_user_app/screens/home/home_screen.dart';
import 'package:couldai_user_app/screens/seller/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marketplace Angola',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/register_seller': (context) => const SellerRegisterScreen(),
        '/seller_dashboard': (context) => const SellerDashboardScreen(),
      },
    );
  }
}
