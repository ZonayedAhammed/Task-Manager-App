import 'package:flutter/material.dart';
import 'package:task_manager_new/data/models/network_response.dart';
import 'package:task_manager_new/data/services/network_caller.dart';
import 'package:task_manager_new/data/utils/urls.dart';
import 'package:task_manager_new/ui/widgets/screen_background.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _signupInProgress = false;



  Future<void> userSignUp() async {

    _signupInProgress = true ;
    if(mounted){
      setState(() {
      });
    }



    final NetworkResponse response =
    await NetworkCaller().postRequest(Urls.registration, <String, dynamic>{
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text.trim(),
      "photo": ""

    });
    _signupInProgress = false;
    if(mounted){
      setState(() {
      });
    }

    if (response.isSuccess) {

      _emailTEController.clear();
      _firstNameTEController.clear();
      _lastNameTEController.clear();
      _mobileTEController.clear();
      _passwordTEController.clear();


      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
            const SnackBar(content: Text('Registration success!')));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
            const SnackBar (content: Text('Registration failed!')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Join With Us',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _emailTEController,

                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _firstNameTEController,

                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your First Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _lastNameTEController,

                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your Last Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Mobile',
                      ),
                      validator: (String? value) {
                        if ((value?.isEmpty ?? true) || value!.length <= 10) {
                          return 'Enter your valid Mobile';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (String? value) {
                        if ((value?.isEmpty ?? true) || value!.length <= 5) {
                          return 'Enter a Password more than 6 letters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible:  _signupInProgress == false,
                        replacement: const Center( child: CircularProgressIndicator()),

                        child: ElevatedButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }
                            userSignUp();
                          },
                          child: const Text(
                            '>',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Have account?",
                          style: TextStyle(color: Colors.black),
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
        ),
      ),
    );
  }
}
