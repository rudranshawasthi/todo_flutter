import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData,child){
        return  ListView.builder(
          itemBuilder:(context, index){
            final task = taskData.tasks[index];
            print(task.name);
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback:(bool checkboxState){
                taskData.updateTask(task);
              },
              longPressCallback: (){
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}