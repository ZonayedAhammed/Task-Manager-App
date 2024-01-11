import 'package:flutter/material.dart';
import 'package:task_manager_new/data/models/network_response.dart';
import 'package:task_manager_new/data/models/summary_count_model.dart';
import 'package:task_manager_new/data/models/task_list_model.dart';
import 'package:task_manager_new/data/services/network_caller.dart';
import 'package:task_manager_new/data/utils/urls.dart';
import 'package:task_manager_new/ui/taskscreen/add_new_task_screen.dart';
import 'package:task_manager_new/ui/widgets/summary_card.dart';
import 'package:task_manager_new/ui/widgets/task_list_tile.dart';

import '../widgets/user_profile_banner.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool _getCountSummaryInProgress = false, _getNewTaskInProgress = false;
  SummaryCountModel _summaryCountModel = SummaryCountModel();
  TaskListModel _taskListModel = TaskListModel();

  @override
  void iniState() {
    super.initState();
    // after instate binding //
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCountSummary();
      getNewtasks();
    });
  }

  Future<void> getCountSummary() async {
    _getCountSummaryInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.taskStatusCount);
    if (response.isSuccess) {
      _summaryCountModel = SummaryCountModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Summary data get failed')));
      }
    }
    _getCountSummaryInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  //=====================================================

  Future<void> getNewtasks() async {
    _getNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.NewTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('New Task data get failed')));
      }
    }
    _getNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),


            _getCountSummaryInProgress
                ? const LinearProgressIndicator()
                : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _summaryCountModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return  SummaryCard(
                            title: _summaryCountModel.data![index].sId ?? 'New',
                            number: _summaryCountModel.data![index].sum ?? 0,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider(
                            height: 5,
                          );
                        },
                      ),
                    ),
                ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  getNewtasks();
                },
                child: _getNewTaskInProgress
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
                          return const Divider(height: 5);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewTask()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
