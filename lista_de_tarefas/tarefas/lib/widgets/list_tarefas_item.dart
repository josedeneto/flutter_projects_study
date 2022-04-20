/*
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:tarefas/models/tarefas.dart';

class ListaTarefaItem extends StatelessWidget {
  const ListaTarefaItem({Key? key, required this.todo, required this.onDelete})
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
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[200],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(DateFormat('dd/mm/yyyy - HH:mm').format(todo.dateTime),
                  style: TextStyle(
                    fontSize: 12,
                  )),
              Text(
                todo.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        endActionPane: ActionPane(motion: ScrollMotion(), children: [
          SlidableAction(
            label: 'Apagar',
            onPressed: (BuildContext context) {
              onDelete(todo);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ]),
      ),
    );
  }
}
*/