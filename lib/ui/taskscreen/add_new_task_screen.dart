import 'package:flutter/material.dart';
import 'package:task_manager_new/data/models/network_response.dart';
import 'package:task_manager_new/data/services/network_caller.dart';
import 'package:task_manager_new/data/utils/urls.dart';
import 'package:task_manager_new/ui/widgets/user_profile_banner.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({
    super.key,
  });
  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}
class _AddNewTaskState extends State<AddNewTask> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  bool _addNewTaskProgress = false;
  Future<void> addNewTask() async {
    _addNewTaskProgress = true;
    if (mounted) {

      setState(() {});
    }
    Map<String, dynamic> requestBody = {
      "title": _titleTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      "status": "New"
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.createTask, requestBody);
    _addNewTaskProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      _titleTEController.clear();
      _descriptionTEController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Task added SuccessFully')));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Task add Failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const UserProfileBanner(),
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
                  TextFormField(
                    controller: _titleTEController,
                    style: const TextStyle(color: Colors.red),
                    decoration: const InputDecoration(
                      hintText: 'Subject',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _descriptionTEController,
                    decoration: const InputDecoration(
                      hintText: 'Description',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: double.infinity,
                    child:Visibility(
                      visible: _addNewTaskProgress == false,
                      replacement: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          addNewTask();
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
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
