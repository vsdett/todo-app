import 'package:flutter/material.dart';
import 'package:todoapp/constraints/colors.dart';
import 'package:todoapp/model/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key, required this.todo, this.ontodochange, this.ondelete});
  final Todo todo;
  final ontodochange;
  final ondelete;


  @override
  Widget build(BuildContext context) {
    int f=0;
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          ontodochange(todo);

        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: todo.isFinished ? Colors.blue: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
        leading: Icon(
          todo.isFinished? Icons.check :Icons.check_box_outline_blank,
          color: tdBLue,
        ),
        title: Text(todo.task!,style: TextStyle(fontSize: 20,decoration: todo.isFinished ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: tdred,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.white,
            onPressed: () {
              ondelete(todo.id);

            },

            iconSize: 18,

            
          ),
        ),
      ),
    );
  }
}
