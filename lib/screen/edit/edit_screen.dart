import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todolist/data/data.dart';
import 'package:todolist/data/repo/repository.dart';
import 'package:todolist/main.dart';

class EditScreen extends StatefulWidget {
  final TaskEntitiy task;
<<<<<<< HEAD
  const EditScreen({required this.task});
=======
  const EditScreen({super.key, required this.task});
>>>>>>> blocdev_2

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late final TextEditingController _taskContentController =
      TextEditingController(text: widget.task.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          backgroundColor: primaryColor,
          onPressed: () {
            widget.task.content = _taskContentController.text;
            widget.task.isCompleted = false;
            widget.task.priority = Priority.normal;
            final repository =
                Provider.of<Repository<TaskEntitiy>>(context, listen: false);
            repository.createOrUpdate(widget.task);
            Navigator.of(context).pop();
          },
          label: Row(
            children: [
              const Text(
                'Save Changes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                CupertinoIcons.check_mark,
                color: secondryTextColor,
                size: 17,
              )
            ],
          )),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: primaryTextColor,
        title: const Text(
          'Edit Task',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _taskContentController,
              decoration:
                  InputDecoration(label: Text('Add a task for today ...')),
            )
          ],
        ),
      ),
    );
  }
}
