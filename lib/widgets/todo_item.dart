import 'package:flutter/material.dart';
import 'package:flutter_todo/constants/colors.dart';
import 'package:flutter_todo/model/todo.dart';

class TodoItem extends StatelessWidget {

  final ToDo todo;

  const TodoItem({super.key,required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        onTap: (){
          print('Clicked on Item');
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(todo.isDone ? Icons.check_box : Icons.check_box_outline_blank, color: tdBlue),
        title: Text(todo.todoText!,style: TextStyle(fontSize: 16, color: tdBlack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null)),
        trailing: Container(
          height: 35,
          width: 35,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
              onPressed: (){
                print('delete icon pressed');
              },
              icon: Icon(Icons.delete),
              color: Colors.white,
              iconSize: 18,
          )
        ),
      ),
    );
  }
}
