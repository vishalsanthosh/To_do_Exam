import 'package:exam_05_10_2024/todo_exam.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do-Exam',
      theme: ThemeData(
      ),
      home: ToDoExam(),
    );
  }
}
