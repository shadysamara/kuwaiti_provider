import 'package:hive/hive.dart';
import 'package:zoom_course/services/database_helper.dart';

class Task {
  String taskTitle;

  String taskDescription;

  bool isComplete;
  Task({this.isComplete, this.taskDescription, this.taskTitle});
  toogleTask() {
    this.isComplete = !this.isComplete;
  }

  Task.fromMap(Map map) {
    this.taskTitle = map[DBHelper.taskNameColumnName];
    this.taskDescription = map[DBHelper.taskDescriptionColumnName];
    this.isComplete =
        map[DBHelper.taskIsCompleteColumnName] == 1 ? true : false;
  }
  Map<String, dynamic> toMap() {
    return {
      DBHelper.taskNameColumnName: this.taskTitle,
      DBHelper.taskDescriptionColumnName: this.taskDescription,
      DBHelper.taskIsCompleteColumnName: this.isComplete ? 1 : 0
    };
  }
}
