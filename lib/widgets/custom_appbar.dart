import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  Function fun;
  CustomAppBar(this.title, this.fun);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(translator.translate(title)), actions: [
      IconButton(
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          fun();
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
    ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
}
