import 'package:flutter/material.dart';
import 'package:task_manager_new/data/models/auth_utility.dart';
import 'package:task_manager_new/ui/screens/login_screen.dart';
import 'package:task_manager_new/ui/taskscreen/User_profile_update_screen.dart ';

class UserProfileBanner extends StatefulWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState();
}

class _UserProfileBannerState extends State<UserProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UserProfileScreen()));
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        tileColor: Colors.black54,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            AuthUtility.userinfo?.data?.photo ?? '',
            // ("assets/images/personal.png"),
          ),
          radius: 25,
        ),
        title: Text(
          '${AuthUtility.userinfo.data?.firstName ?? ''} ${AuthUtility.userinfo.data?.lastName ?? ''}',
          style: const TextStyle(
            fontSize: 19,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          (AuthUtility.userinfo.data?.email ?? 'UnKnown '),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        trailing: IconButton(
          onPressed: () async {
            await AuthUtility.clearUserInfo();

            if (mounted) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
            }
          },
          icon: const Icon(Icons.logout),
        ),
      ),
    );
  }
}
