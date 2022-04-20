import 'package:flutter/material.dart';
import 'package:tarefas/pages/list_page.dart';

import 'pages/list_todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListTodoPage(),
    );
  }
}
