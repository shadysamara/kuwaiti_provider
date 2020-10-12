import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:zoom_course/models/task.dart';
import 'package:zoom_course/providers/todo_provider.dart';
import 'package:zoom_course/ui/widgets/task_widget.dart';

class TodoMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('newTaskPage');
              },
            ),
            IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                translator.setNewLanguage(
                  context,
                  newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                  remember: true,
                  restart: true,
                );
              },
            )
          ],
          bottom: TabBar(tabs: [
            Tab(
              text: translator.translate('all_tasks'),
            ),
            Tab(
              text: translator.translate('complete_tasks'),
            ),
            Tab(
              text: translator.translate('incomplete_tasks'),
            )
          ]),
          title: Text(translator.translate('app_name')),
        ),
        body: Container(
            child: TabBarView(children: [
          AllTasksTab(),
          CompleteTasksTab(),
          InCompleteTasksTab(),
        ])),
      ),
    );
  }
}

class AllTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TodoProvider>(
      builder: (context, value, child) {
        List<Task> allTasks = value.allTasks;
        return allTasks.length > 0
            ? ListView.builder(
                itemCount: allTasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(allTasks[index]);
                },
              )
            : Center(
                child: Text('No Tasks'),
              );
      },
    );
  }
}

class CompleteTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Selector<TodoProvider, List<Task>>(
      selector: (context, todoProvider) => todoProvider.getCompleteTasks,
      builder: (context, value, child) {
        List<Task> completedTasks = value;
        return completedTasks.length > 0
            ? ListView.builder(
                itemCount: completedTasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(completedTasks[index]);
                },
              )
            : Center(
                child: Text('No Tasks'),
              );
      },
    );
  }
}

class InCompleteTasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Selector<TodoProvider, List<Task>>(
      selector: (context, todoProvider) => todoProvider.getInCompleteTasks,
      builder: (context, value, child) {
        List<Task> inCompletedTasks = value;
        return inCompletedTasks.length > 0
            ? ListView.builder(
                itemCount: inCompletedTasks.length,
                itemBuilder: (context, index) {
                  return TaskWidget(inCompletedTasks[index]);
                },
              )
            : Center(
                child: Text('No Tasks'),
              );
      },
    );
  }
}
