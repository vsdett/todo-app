class Todo{
  String? task;
  String? id;
  bool isFinished;
  Todo({
    required this.id,
    required this.task,
    this.isFinished=false

});

  static List<Todo> todolist(){
    return [
      Todo(id: "01",task: "Example Task 1", isFinished: true),



    ];
  }

}