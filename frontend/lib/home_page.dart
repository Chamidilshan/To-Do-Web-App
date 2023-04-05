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
      appBar: AppBar(
        title: Text(
          'To Do App',
        ),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        child: Center(
          child: Column(
            children: [
              Text('Manage your work'),
              SizedBox(
                height: 20.0,
              ),
              Text('Your tasks'),
              SizedBox(
                height: 20.0,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: tasks?.length,
                  itemBuilder: (context, index){
                    return Text(tasks![index].text);
                  }),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(onPressed: () {
                Navigator.push(context,  MaterialPageRoute(builder: (context) => NewTaskPage()));
              },
                  child: Text('Add a task')
              )
            ],
          ),
        ),
        replacement: CircularProgressIndicator(),
      ),
    );
  }
}
