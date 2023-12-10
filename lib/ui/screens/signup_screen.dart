import 'package:flutter/material.dart';
import 'package:task_manager_new/ui/widgets/screen_background.dart';

import 'email_verification_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  'Join With Us',
                  style: Theme.of(context).textTheme.titleLarge,
                 ),
                const SizedBox(height: 16.0),

                const TextField(
                  style:TextStyle(color: Colors.red),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),

                const SizedBox(height: 16.0),

                const TextField(
                  style:TextStyle(color: Colors.red),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                  ),
                ),

                const SizedBox(height: 16.0),

                const TextField(
                  style:TextStyle(color: Colors.red),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(

                    hintText: 'Last Name',
                  ),
                ),

                const SizedBox(height: 16.0),

                const TextField(
                  style:TextStyle(color: Colors.red),
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Mobile',
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
                    onPressed: () {},
                    child: const Text('>', style: TextStyle(color: Colors.white, fontSize: 25),),
                    
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have account?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                              (route) => false);
                    }, child: const Text('Sign in',style: TextStyle(color: Colors.green),)),
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

