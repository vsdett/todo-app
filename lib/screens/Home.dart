import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';

import '../constraints/colors.dart';
import '../widgets/todo_item.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Todolist=Todo.todolist();
  final todocontroller=TextEditingController();
  List<Todo> foundtodo=[];
  @override
  void initState() {
    // TODO: implement initState
    foundtodo=Todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: buildAppBar(),

      body: Stack(
        children:[ Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
          child: Column(
            children: [
              SearchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(

                      margin: const EdgeInsets.only(top: 50,bottom: 20),
                        child: const Text("Your Tasks",style: TextStyle(fontSize: 30,fontWeight:FontWeight.w300 ),),
                    ),
                    for(Todo todoo in foundtodo)
                      TodoItem(todo: todoo,
                      ontodochange: ontodochange,
                      ondelete: onDelete),






                  ],

                ),
              )

            ],
          ),
        ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20,right: 20,left: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(color: Colors.grey,
                      blurRadius: 10.0,
                        spreadRadius: 0.0,
                        offset: Offset(0.0,0.0)

                      )],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextField(
                      controller: todocontroller,
                      decoration: const InputDecoration(
                        hintText: "Add a task",
                        border: InputBorder.none
                      ),
                    ),


                  ),
                ),
                Container(
                   padding: const EdgeInsets.only(bottom: 20,right: 20),


                    child: ElevatedButton(onPressed: (){
                      addtodoitem(todocontroller.text);
                    },

                   style: ElevatedButton.styleFrom(


                     minimumSize: const Size(60,60),
                     elevation: 8
                   ), child: const Text("+",style: TextStyle(fontSize: 40 ),), ))
              ],
            ),
          )]
      ),

    );
  }
  void ontodochange(Todo todo){
    setState(() {
      todo.isFinished= !todo.isFinished;

    });
  }
  void onDelete(String id){
    setState(() {
      Todolist.removeWhere((element) => element.id==id);
    });
  }
  void addtodoitem(String task){
    setState(() {
      Todolist.add(Todo(id: DateTime.now().millisecondsSinceEpoch.toString(), task: task));
    });
    todocontroller.clear();
  }
  void searchitem(String entereditem){
    List<Todo>? result=[];
    if(entereditem.isEmpty){
      result=Todolist;
    }
    else{
      result=Todolist.where((element) => element.task!.toLowerCase().contains(entereditem.toLowerCase())).toList();

    }
    setState(() {
      foundtodo=result!;


    });
  }
  Widget SearchBox(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)

      ),
      child: TextField(
        onChanged: (value)=> searchitem(value),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Icon(Icons.search),
            prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
            border: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(fontSize: 20)

        ),
      ),
    );
  }
  AppBar buildAppBar() {
    return AppBar(

      backgroundColor: tdBGColor,
      title:  const Center(child: Text("Todo App",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 25,color: tdGrey),)),

    );
  }
}

