import 'package:flutter/material.dart';
import 'package:task_manager_new/ui/taskscreen/add_new_task_screen.dart';
import 'package:task_manager_new/ui/widgets/summary_card.dart';
import 'package:task_manager_new/ui/widgets/task_list_tile.dart';

import '../widgets/user_profile_banner.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: 'New Task',
                      number: 123,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: 'Progress',
                      number: 123,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: 'Complete',
                      number: 123,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      title: 'Canceled',
                      number: 123,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const TaskListTile();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 5);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewTask()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


