import 'package:flutter/material.dart';
import 'package:task_manager_new/ui/screens/pin_verification_screen.dart';
import 'package:task_manager_new/ui/widgets/screen_background.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

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
                const SizedBox(height: 64,),
                Text(
                  'Email Verification',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'A 6 digits pin will sent to your email address',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 24,),
                const TextField(
                  style: TextStyle(color: Colors.red),
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OtpVerificationScreen()));
                    },
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.red),
                    ),
                    TextButton(onPressed: () {
                      Navigator.pop(context);
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
