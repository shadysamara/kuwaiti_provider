import 'package:flutter/material.dart';
import 'package:zoom_course/models/task.dart';

class TodoProvider extends ChangeNotifier {
  List<Task> allTasks = [];
  List<Task> completedTasks = [];
  List<Task> inCompletedTasks = [];

  List<Task> get getAllTasks => allTasks;
  List<Task> get getCompleteTasks => completedTasks;
  List<Task> get getInCompleteTasks => inCompletedTasks;

  callAllLists() {
    getallTasks();
    getCompletedTasks();
    getInCompletedTasks();
    notifyListeners();
  }

  newTask(Task task) {
    allTasks.add(task);
    callAllLists();
  }

  toggleTask(Task task) {
    int index = allTasks.indexOf(task);
    allTasks[index].toogleTask();
    callAllLists();
  }

  getCompletedTasks() {
    List<Task> tasks =
        allTasks.where((element) => element.isComplete == true).toList();

    this.completedTasks = tasks;
  }

  getallTasks() {
    List<Task> tasks = allTasks;
    this.allTasks = tasks;
  }

  getInCompletedTasks() {
    List<Task> tasks =
        allTasks.where((element) => element.isComplete == false).toList();
    this.inCompletedTasks = tasks;
  }
}
