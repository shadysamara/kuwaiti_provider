import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SharedPreferences prefs;
  static SPHelper spHelper = SPHelper();

  Future<SharedPreferences> initSp() async {
    prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  setSPVaraibles() async {
    prefs = await initSp();
    prefs.setBool('boolValue', true);
    prefs.setDouble('doubleValue', 50.2);
    prefs.setInt('intValue', 20);
    prefs.setString('stringVakue', 'name');
    prefs.setStringList('listValue', ['ahmed', 'mohammed', 'adel']);
  }

  getSpVariables() async {
    prefs = await initSp();
    print(prefs.getBool('boolValue'));
    print(prefs.getDouble('doubleValue'));
    print(prefs.getInt('intValue'));
    print(prefs.getString('stringVakue'));
    print(prefs.getStringList('listValue'));
  }

  checkIsFirstTime() {
    bool result = prefs.containsKey('isFirstt');
    if (result == false) {
      return true;
    } else {
      return false;
    }
  }

  setIsNotFirstTime() async {
    prefs = await initSp();
    prefs.setBool('isFirstt', false);
  }

// _write(String text) async {
//   final Directory directory = await getApplicationDocumentsDirectory();
//   final File file = File('${directory.path}/my_file.txt');
//   await file.writeAsString(text);
// }

// Future<String> _read() async {
//   String text;
//   try {
//     final Directory directory = await getApplicationDocumentsDirectory();
//     final File file = File('${directory.path}/my_file.txt');
//     text = await file.readAsString();
//   } catch (e) {
//     print("Couldn't read file");
//   }
//   return text;
// }
}
