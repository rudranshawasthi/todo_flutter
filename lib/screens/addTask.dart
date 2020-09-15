import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class AddTaskSheet extends StatelessWidget {

  final Function addTaskCallback;
  AddTaskSheet(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {

    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20)
          )
        ),
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10,),
            TextField(
              style: TextStyle(
                fontSize: 20
              ),
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (val){
                newTaskTitle = val;
              },
            ),
            SizedBox(height: 10,),
            FlatButton(
                onPressed: (){
                  Provider.of<TaskData>(context).addTask(newTaskTitle);
                  Navigator.pop(context);
                 },
                child: Text(
                    'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
