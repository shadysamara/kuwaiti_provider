import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:zoom_course/models/task.dart';
import 'package:zoom_course/services/database_helper.dart';
import 'package:zoom_course/services/sp_helper.dart';
import 'package:zoom_course/services/write_on_files.dart';

class SpTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('sp test'),
        ),
        body: Center(child: RaisedButton(
          onPressed: () async {
            List<Task> reponse = await DBHelper.dbHelper.getAllTasks();
            print(reponse);
          },
        )));
  }
}
