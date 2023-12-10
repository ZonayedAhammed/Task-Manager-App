import 'package:flutter/material.dart';
import 'package:task_manager_new/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_manager_new/ui/screens/signup_screen.dart';
import 'package:task_manager_new/ui/widgets/screen_background.dart';

import 'email_verification_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Get Started with',
                  style: Theme.of(context).textTheme.titleLarge,
                 ),

                const SizedBox(height: 16.0),

                const TextField(
                  style:TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),

                const SizedBox(height: 16.0),

                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),

                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>  BottomNavBaseScreen()), (route) => false);
                    },
                    child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
                  ),
                ),
                
                Center(
                    child: InkWell(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder:(context) => const
                                EmailVerificationScreen()));
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.red),
                          )),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.red),
                    ),
                    TextButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    }, child: const Text('Sign up',style: TextStyle(color: Colors.green),)),
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

