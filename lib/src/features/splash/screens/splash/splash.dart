import 'package:flutter/material.dart';
import 'package:hungyhub/src/config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> navToHome() async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.of(context).pushReplacementNamed(AppRoutes.home);
  }

  @override
  void initState() {
    super.initState();

    navToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
