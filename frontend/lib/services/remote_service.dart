import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:to_do_app/models/tasks.dart';

class RemoteService{
  Future<List<Task>?> getTasks() async{
    //var client = http.Client();
    var uri = Uri.parse('http://localhost:3000/api/tasks');
    var response = await get(uri);

    if(response.statusCode == 200){
      var json = response.body;
      return taskFromJson(json);
    };
  }

  Future<List<Task>?> addTask(String taskText) async{
    var uri = Uri.parse('http://localhost:3000/api/tasks');
    var response = await post(uri, body: {'text': taskText});

    if(response.statusCode == 200){
      var json = response.body;
      if (json != null) {
        return taskFromJson(json);
      } else {
        throw Exception('Response body is null');
      }
    };
  }

}