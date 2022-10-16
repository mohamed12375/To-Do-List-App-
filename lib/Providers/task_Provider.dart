import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutterpro/Constants/constans.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../Boxes/Boxes.dart';
import '../Boxes/TaskBox.dart';

class TaskProvider extends ChangeNotifier {
  String _type = Constants().TasksTypes.first;
  Box<TaskBox> getTasks() => Hive.box<TaskBox>(Constants().tasks);

  String get type => _type;

  late TaskBox task;
  late String name = "";
  late String tasktype = '';
  late DateTime time = DateTime.now();
  late bool notify = false;

  setType(value) {
    _type = value;
    notifyListeners();
  }

  setTaskInfo(TaskBox taskI, String nameI, String typeI, DateTime timeI) {
    task = taskI;
    name = nameI;
    tasktype = typeI;
    time = timeI;
    notifyListeners();
  }

  void AddTask(String name, String type, DateTime time) {
    TaskBox taskBox = TaskBox();
    taskBox.Name = name;
    taskBox.Type = type;
    taskBox.time = time;
    taskBox.isDone = false;
    taskBox.notify = true;

    Box box = getTasks();
    box.add(taskBox);
  }

  void EditTask(TaskBox taskBox, String name, String type, DateTime time) {
    taskBox.Name = name;
    taskBox.Type = type;
    taskBox.time = time;
    taskBox.save();
  }

  void deleteTask(TaskBox taskBox) {
    taskBox.delete();
  }

  void taskStatus(TaskBox taskBox) {
    taskBox.isDone = !taskBox.isDone;
    taskBox.save();
    notifyListeners();
  }

  void taskNotify(TaskBox taskBox) {
    taskBox.notify = !taskBox.notify;
    taskBox.save();
    notifyListeners();
  }
}
