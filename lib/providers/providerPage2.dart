import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_course/providers/kuwaiti_provider.dart';
import 'package:zoom_course/providers/providerPage.dart';

class ProviderPage2 extends StatelessWidget {
  KuwaitiProvider kuwaitiProvider;

  String name;

  @override
  Widget build(BuildContext context) {
    kuwaitiProvider = Provider.of<KuwaitiProvider>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
                initialValue: kuwaitiProvider.name ?? '',
                onChanged: (value) {
                  kuwaitiProvider.setName(value);
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)))),
            CheckboxListTile(
                title: Text('Accept'),
                value: kuwaitiProvider.isAccepted ?? false,
                onChanged: (value) {
                  kuwaitiProvider.setIsAccepted(value);
                }),
            RadioListTile(
              value: 0,
              groupValue: kuwaitiProvider.gender,
              onChanged: (value) {
                kuwaitiProvider.setGender(value);
              },
            ),
            RadioListTile(
              value: 1,
              groupValue: kuwaitiProvider.gender,
              onChanged: (value) {
                kuwaitiProvider.setGender(value);
              },
            ),
            RaisedButton(onPressed: () {
              Navigator.of(context).pop();
            })
          ],
        ),
      ),
    );
  }
}
