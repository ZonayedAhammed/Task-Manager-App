import 'package:flutter/material.dart';
import 'package:task_manager_new/ui/screens/login_screen.dart';
import 'package:task_manager_new/ui/screens/pin_verification_screen.dart';
import 'package:task_manager_new/ui/widgets/screen_background.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 64,
                ),
                Text(
                  'Set Password',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Minimum password should be 8 Letters with Number & Symbols',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const TextField(
                  style: TextStyle(color: Colors.red),
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  obscureText: true,
                ),
                const TextField(
                  style: TextStyle(color: Colors.red),
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LoginScreen()));
                    },
                    child: const Text('Confirm',  style: TextStyle(color: Colors.white),),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Have account?",
                      style: TextStyle(color: Colors.red),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                                  (route) => false);
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(color: Colors.green),
                        )),
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
