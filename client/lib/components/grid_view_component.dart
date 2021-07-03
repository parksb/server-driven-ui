import 'package:flutter/material.dart';

import 'registry.dart';
import 'component.dart';

class GridViewComponent implements Component {
  Widget compose(Map<String, dynamic> args, BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        crossAxisCount: args["columnCount"],
        children: Registry.getComponents(args["children"], context),
      ),
    );
  }
}
