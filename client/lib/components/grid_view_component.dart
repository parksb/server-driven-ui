import 'package:flutter/material.dart';

import 'registry.dart';
import 'component.dart';

class GridViewComponent implements Component {
  Widget compose(Map<String, dynamic> args, BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: args["columnCount"],
        children: Registry.getComponents(args["children"], context),
      ),
    );
  }
}
