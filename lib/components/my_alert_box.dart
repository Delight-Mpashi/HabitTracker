// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  const MyAlertBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel,
      required this.hintText});

  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: TextField(
        controller: controller,
        style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: onSave,
          child: Text('Add'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        ),
        ElevatedButton(
          onPressed: onCancel,
          child: Text('Cancel'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        )
      ],
    );
  }
}
