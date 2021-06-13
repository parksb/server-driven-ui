import 'package:flutter/material.dart';

import '../api/screen_query.dart';

class HomeScreen extends StatelessWidget {
  Future<List<Widget>> _load(BuildContext context) async {
    return ScreenQuery.fetchComponents(context, ScreenType.HOME);
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
