import 'package:flutter/material.dart';
import 'package:lab_7/first_screen.dart';
import 'first_screen.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Registration Screen'),
      ),
      body: const FirstScreen(),
    ),
  ));
}

