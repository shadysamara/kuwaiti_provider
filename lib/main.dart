import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_course/providers/kuwaiti_provider.dart';
import 'package:zoom_course/providers/providerPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<KuwaitiProvider>(
      create: (BuildContext context) {
        return KuwaitiProvider();
      },
      child: MaterialApp(
        home: ProviderPage(),
      ),
    );
  }
}
