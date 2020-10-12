import 'package:hive/hive.dart';
import 'package:zoom_course/models/task.dart';

class HiveHelper {
  HiveHelper._();
  static HiveHelper helper = HiveHelper._();
  String boxName = 'tasksBox';
  Box box;
  initTasksBox() {
    box = Hive.box(boxName);
  }
}
