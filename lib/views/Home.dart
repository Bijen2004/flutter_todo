import 'package:flutter/material.dart';
import 'package:flutter_todo/constants/colors.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/widgets/todo_item.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar:buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Column(
          children: [
            searchBox(),
            Expanded(child:
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, bottom: 20),
                  child: Text(
                    'All Todos',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30
                    ),
                  ),
                ),
                for (ToDo todo in todosList)
                TodoItem(todo: todo)
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search),
            prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 75),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(
                color: tdGrey
            )
        ),
      )
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu,color: tdBlack,size: 30),
          Icon(Icons.supervised_user_circle_sharp,size: 40)
        ],
      ),
    );
  }
}
