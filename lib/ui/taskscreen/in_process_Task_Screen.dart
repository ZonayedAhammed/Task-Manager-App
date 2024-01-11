import 'package:flutter/material.dart';
import 'package:task_manager_new/data/models/network_response.dart';
import 'package:task_manager_new/data/models/task_list_model.dart';
import 'package:task_manager_new/data/services/network_caller.dart';
import 'package:task_manager_new/data/utils/urls.dart';
import 'package:task_manager_new/ui/taskscreen/new_task_Screen.dart';
import 'package:task_manager_new/ui/widgets/task_list_tile.dart';

import '../widgets/user_profile_banner.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({super.key});

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {
  bool _getProgressTaksInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  Future<void> getInProgressTasks() async {
    _getProgressTaksInProgress = true;
    if (mounted) {
      setState(() {});
    }

    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.inProgressTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('In progress Task get failed')));
      }
    }
    _getProgressTaksInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getInProgressTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
            Expanded(
              child: _getProgressTaksInProgress
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      itemCount: _taskListModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return TaskListTile(
                          data: _taskListModel.data![index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                            height: 5);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
