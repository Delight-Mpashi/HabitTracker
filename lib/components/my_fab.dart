import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_alert_box.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Function()? onPressed;

  const MyFloatingActionButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: onPressed, child: Icon(Icons.add));
  }
}
