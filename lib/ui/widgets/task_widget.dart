import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_course/models/task.dart';
import 'package:zoom_course/providers/todo_provider.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget(this.task);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
      title: Text(task.taskTitle),
      subtitle: Text(task.taskDescription),
      trailing: Checkbox(
        value: task.isComplete,
        onChanged: (value) {
          Provider.of<TodoProvider>(context, listen: false).toggleTask(task);
        },
      ),
    ));
  }
}
