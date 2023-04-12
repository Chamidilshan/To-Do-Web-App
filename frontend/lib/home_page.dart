import 'package:flutter/material.dart';
import 'package:to_do_app/new_task.dart';
import 'package:to_do_app/services/remote_service.dart';
import 'models/tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Task>? tasks;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    getData();
  }

  getData() async{
    tasks = await RemoteService().getTasks();

    if(tasks != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Visibility(
        visible: isLoaded,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30.0),
            Text(
              'Manage Your Tasks',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Create a list of tasks, set deadlines or reminders, and mark tasks as completed when finished.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Your Tasks:',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: tasks?.length,
                  itemBuilder: (context, index){
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: ListTile(
                        title: Text(
                          tasks![index].text,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // trailing: Checkbox(
                        //   value: tasks![index].completed,
                        //   onChanged: (bool? value) {},
                        // ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NewTaskPage()));
              },
              child: Text(
                'Add a Task',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ),
        replacement: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}