import 'package:flutter/material.dart';
import 'package:task_manager_new/ui/taskscreen/User_profile_update_screen.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context) => const
        UserProfileScreen()));
      },
      child: const ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        tileColor: Colors.black54,
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/images/personal.png"),
          radius: 25,
        ),
        title: Text(
          'User Name',
          style: TextStyle(
            fontSize: 19,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          'User Email',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
