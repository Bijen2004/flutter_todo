class ToDo{
  String? id;
  String todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false
  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '1', todoText: 'Buy groceries', isDone: false),
      ToDo(id: '2', todoText: 'Play basketball', isDone: true),
      ToDo(id: '3', todoText: 'Finish Flutter project', isDone: false),
      ToDo(id: '4', todoText: 'Water the plants', isDone: false),
      ToDo(id: '5', todoText: 'Read a book', isDone: true),
      ToDo(id: '6', todoText: 'Reply to emails', isDone: false),
      ToDo(id: '7', todoText: 'Clean the house', isDone: false),
      ToDo(id: '8', todoText: 'Exercise for 30 minutes', isDone: true),
      ToDo(id: '9', todoText: 'Prepare dinner', isDone: false),
      ToDo(id: '10', todoText: 'Plan weekend trip', isDone: false),
    ];
  }

}