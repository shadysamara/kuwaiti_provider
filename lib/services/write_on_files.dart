import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileStorage {
  static writeOnFile(String content) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      File file = File('$appDocPath/flutterFile.txt');
      file.writeAsString(content);
    } catch (e) {
      print(e);
    }
  }
  /*
1- determine the application folder using path provider package
2- create the file
3- write on the created file


  */

  static readFromFile() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    File file = File('$appDocPath/flutterFile2.txt');
    String fileContent = await file.readAsString();
    print(fileContent);
  }
}
