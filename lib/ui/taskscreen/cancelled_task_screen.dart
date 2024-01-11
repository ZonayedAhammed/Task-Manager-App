import 'package:flutter/material.dart';

import '../widgets/task_list_tile.dart';
import '../widgets/user_profile_banner.dart';
class CancelledScreen extends StatelessWidget {
  const CancelledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return SizedBox();
                    //TaskListTile();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 5);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
