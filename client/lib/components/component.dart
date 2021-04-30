import 'package:flutter/material.dart';

abstract class Component {
  Widget compose(Map<String, dynamic> args, BuildContext context);
}
