/*
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tarefas/models/tarefas.dart';
import 'package:tarefas/widgets/list_tarefas_item.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final TextEditingController _controller = TextEditingController();
  List<Todo> todos = [];
  Todo? deleteTodo;
  int? posDeleted;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          label: Text('Adicione uma tarefa'),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String text = _controller.text;
                      setState(() {
                        Todo newTodo =
                            Todo(title: text, dateTime: DateTime.now());
                        todos.add(newTodo);
                      });
                      _controller.clear();
                    },
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF00d7f3),
                        padding: EdgeInsets.all(14)),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (Todo todo in todos)
                      ListaTarefaItem(
                        todo: todo,
                        onDelete: onDelete,
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                          'Você possuí ${todos.length} tarefas pendentes')),
                  ElevatedButton(
                    onPressed:todos.length <=0 ? null:ShowConfirmation,
                      
                    
                    child: Text('Limpar tudo'),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF00d7f3),
                        padding: EdgeInsets.all(14)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void deleteAll() {
    setState(() {
      todos.clear();
    });
  }

  void onDelete(Todo todo) {
    deleteTodo = todo;
    posDeleted = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black,
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              todos.insert(posDeleted!, deleteTodo!);
            });
          },
          textColor: Color(0xFF00d7f3),
        ),
        content: Text(
          'Tarefa ${todo.title} foi removida com sucesso',
          style: TextStyle(
            color: Colors.white,
          ),
        )));
  }

  void ShowConfirmation() {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text('Limpar Tudo?'),
              content:
                  Text('Tem a certeza que quer remover todo«as as tarefas?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar')),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                      deleteAll();
                  },
                  child: Text('Ok'),
                ),
              ],
            ));
  }
}
*/