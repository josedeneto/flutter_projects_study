import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:tarefas/models/todos.dart';

import 'constants.dart';

class ListTodoItem extends StatelessWidget {
  const ListTodoItem({Key? key, required this.todo, required this.onDelete})
      : super(key: key);

  final Todo todo;
  final Function(Todo) onDelete;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Slidable(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[200],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  DateFormat('dd/mm/yyyy - HH:mm')
                      .format(todo.dateTime)
                      .toString(),
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  todo.title,
                  style: defaultTitle,
                )
              ],
            ),
          ),
          endActionPane: ActionPane(motion: ScrollMotion(), children: [
            SlidableAction(
              onPressed: (BuildContext context) {
                onDelete(todo);
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Apagar',
            )
          ]),
        ));
  }
}
