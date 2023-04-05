import 'package:flutter/material.dart';
import 'package:to_do_app/home_page.dart';
import 'package:to_do_app/models/tasks.dart';
import 'services/remote_service.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {

  TextEditingController _taskController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () async {
                if(_taskController.text.isNotEmpty){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                  await RemoteService().addTask(_taskController.text);
                  _taskController.clear();
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
