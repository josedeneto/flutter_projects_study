import 'package:flutter/material.dart';
import 'package:tarefas/models/todos.dart';
import 'package:tarefas/repositories/todo_repositories.dart';
import 'package:tarefas/widgets/constants.dart';
import 'package:tarefas/widgets/list_todo_item.dart';

class ListTodoPage extends StatefulWidget {
  const ListTodoPage({Key? key}) : super(key: key);

  @override
  State<ListTodoPage> createState() => _ListTodoPageState();
}

class _ListTodoPageState extends State<ListTodoPage> {
  final TextEditingController _controller_text_todo = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

  List<Todo> todos = [];
  Todo? deletedTodo;
  int? deletedPos;
  String? errorText;

  @override
  void initState() {
    super.initState();

    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lista de tarefas',
                style: titulo,
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _controller_text_todo,
                      decoration: InputDecoration(
                        errorText: errorText,
                        label: Text('Adicione uma tarefa'),
                        labelStyle: TextStyle(color:colorPrimary, fontWeight: FontWeight.w500),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colorPrimary, width: 2)
                        )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String text = _controller_text_todo.text;

                        if (text.isEmpty) {
                          setState(() {
                            errorText = 'O título não pode ser vazio';
                          });
                          return;
                        }
                        setState(() {
                          Todo newTodo =
                              Todo(title: text, dateTime: DateTime.now());
                          todos.add(newTodo);
                          _controller_text_todo.clear();
                          todoRepository.saveTodoList(todos);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          primary: colorPrimary, padding: EdgeInsets.all(14)),
                      child: Icon(
                        Icons.add,
                        size: 34,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (Todo todo in todos)
                      ListTodoItem(
                        todo: todo,
                        onDelete: onDelete,
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(child: Text('Você tem ${todos.length} pendentes')),
                  ElevatedButton(
                    onPressed: todos.isEmpty ? null : showConfirmation,
                    child: Text('Limpar'),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF00d7f3),
                        padding: EdgeInsets.all(14)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//Function confirmation of remove todo
  void showConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Eliminar tudo?',
          style: defaultTitle,
        ),
        content: Text('Você quer eliminar todas as tarefas?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                Navigator.of(context).pop();
                deleteAll();
              });
            },
            child: Text(
              'OK',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

//Function delete all todo
  void deleteAll() {
    setState(() {
      todos.clear();
    });
    todoRepository.saveTodoList(todos);
  }

  //Function on Delete item
  void onDelete(Todo todo) {
    deletedTodo = todo;
    deletedPos = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
    });
    todoRepository.saveTodoList(todos);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('A tarefa ${todo.title}  foi eliminado'),
        backgroundColor: Colors.black,
        duration: Duration(milliseconds: 1000),
        action: SnackBarAction(
            textColor: Color(0xFF00d7f3),
            label: 'Desfazer',
            onPressed: () {
              setState(() {
                todos.insert(deletedPos!, todo);
              });
              todoRepository.saveTodoList(todos);
            }),
      ),
    );
  }
}
