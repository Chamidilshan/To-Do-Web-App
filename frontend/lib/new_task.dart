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
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Text('Add a new task',
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _taskController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Task',
                  labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
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
                child: Text('Add Task',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    )
                ),
              ),
            ],
          ),
        ), 
      ),
    );
  }
}
