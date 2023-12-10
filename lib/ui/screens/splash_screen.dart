import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_new/data/models/auth_utility.dart';
import 'package:task_manager_new/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_manager_new/ui/utils/assets_utlis.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    navigateToLogin();
    super.initState();
  }

  Future<void> navigateToLogin() async {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      final bool isLoggedIn = await AuthUtility.checkIfuserLoggedIn();
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  isLoggedIn ? const BottomNavBaseScreen() : const LoginScreen()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: SvgPicture.asset(AssetsUtils.backgroundSvg,
                  fit: BoxFit.fitHeight),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              AssetsUtils.logoSvg,
              width: 300,
              fit: BoxFit.scaleDown,
            ),
          )
        ],
      ),
    );
  }
}
