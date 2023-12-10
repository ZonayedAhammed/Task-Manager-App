import 'package:flutter/material.dart';
import 'package:task_manager_new/ui/screens/bottom_nav_base_screen.dart';
import 'package:task_manager_new/ui/widgets/user_profile_banner.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
          children: [
          const  UserProfileBanner(),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Add New Task',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const TextField(
                    style:TextStyle(color: Colors.red),
                    decoration: InputDecoration(
                      hintText: 'Subject',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Description',
                    ),
                  ),

                  const SizedBox(height: 16.0),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
                    ),
                  ),
               ],
             ),
           ),
          ],
        ),
      ),
    );
  }
}
