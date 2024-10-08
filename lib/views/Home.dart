import 'package:flutter/material.dart';
import 'package:flutter_todo/constants/colors.dart';
import 'package:flutter_todo/model/todo.dart';
import 'package:flutter_todo/widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> foundToDo =[];
  final todoController = TextEditingController();

  @override
  void initState() {
    foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar:buildAppBar(),
      body: Stack(
        children: [Container(
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
                  for (ToDo todoo in foundToDo.reversed)
                  TodoItem(
                    todo: todoo,
                    onTodoChanged: handleTodoChange,
                    onDeleteItem: deleteTodoItem,
                  )
                ],
              )),
            ],
          ),
        ),Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 0),
                    blurRadius: 10.0,
                    spreadRadius: 0
                  ),],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  controller: todoController,
                  decoration: InputDecoration(
                    hintText: 'Add a todo item',
                    border: InputBorder.none
                  ),
                ),
              ),
              ),
              Container(
                margin: EdgeInsets.only(bottom:20,right: 20),
                child: ElevatedButton(
                    onPressed: (){
                      addTodo(todoController.text);
                    },
                    child: Text('+',style: TextStyle(fontSize: 40,color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdBlue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),

              )
            ],
          ),
        )
        ]
      ),
    );
  }

  void addTodo(String toDo){
    setState(() {
      todosList.add(ToDo(id:DateTime.now().millisecondsSinceEpoch.toString(),todoText: toDo));
    });
    todoController.clear();
  }

  void runFilter(String keyword){
    List<ToDo> results = [];
    if(keyword.isEmpty){
      results = todosList;
    } else{
      results = todosList.where((item)=> item.todoText!.toLowerCase().contains(keyword.toLowerCase())).toList();
    }
    setState(() {
      foundToDo = results;
    });
  }

  void deleteTodoItem(String id){
    setState(() {
      todosList.removeWhere((item)=>item.id == id);
    });
  }

  void handleTodoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value)=>runFilter(value),
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
