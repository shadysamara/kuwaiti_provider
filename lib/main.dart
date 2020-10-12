import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:zoom_course/providers/todo_provider.dart';
import 'package:zoom_course/services/sp_helper.dart';
import 'package:zoom_course/ui/pages/new_task.dart';
import 'package:zoom_course/ui/pages/sp_test.dart';
import 'package:zoom_course/ui/pages/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SPHelper.spHelper.initSp();

  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/langs/',
    apiKeyGoogle: '<Key>',
  ); // intialize
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  Hive..init(appDocPath);

  runApp(LocalizedApp(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<TodoProvider>(
      create: (BuildContext context) {
        return TodoProvider();
      },
      child: MaterialApp(
        localizationsDelegates: translator.delegates,
        locale: translator.locale,
        supportedLocales: translator.locals(),
        routes: {
          '/': (context) => SpTest(),
          'newTaskPage': (context) => NewTask()
        },
      ),
    );
  }
}
