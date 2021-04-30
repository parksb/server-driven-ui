import 'package:flutter/material.dart';

import '../api/screen_query.dart';
import '../components/registry.dart';

class HomeScreen extends StatelessWidget {
  Future<List<Widget>> _load(BuildContext context) async {
    var data = await ScreenQuery.fetch(ScreenType.HOME);
    var components = data['screen']['components'] as List<dynamic>;
    return components.map((component) => Registry.getComponent(component, context)).toList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            FutureBuilder(
              future: _load(context),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Column(children: snapshot.data);
                }
              },
            ),
          ],
        )
    );
  }
}
