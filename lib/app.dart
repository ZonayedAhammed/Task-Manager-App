import 'package:flutter/material.dart';
import 'package:task_manager_new/ui/screens/splash_screen.dart';
class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness:Brightness.light,
        primarySwatch: Colors.red,
        inputDecorationTheme: const  InputDecorationTheme(
        filled: true,
          fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        border: OutlineInputBorder(borderSide:BorderSide.none),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green)
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
          ),
        ),
      ),


      darkTheme: ThemeData(
          brightness: Brightness.dark
      ),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
