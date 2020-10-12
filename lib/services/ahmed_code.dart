import 'package:shared_preferences/shared_preferences.dart';

class SpHelpper {
  static SpHelpper spHelpper = SpHelpper();
  SharedPreferences prefs;
  initsp() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> isCheckFirst() async {
    await initsp();
    if (prefs.containsKey("firstTime")) {
      return true;
    }
    prefs.setBool('firstTime', false);
    return false;
  }
}
