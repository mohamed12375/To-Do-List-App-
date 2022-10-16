import 'package:flutterpro/Boxes/TaskBox.dart';
import 'package:flutterpro/Constants/constans.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<TaskBox> getTasks() => Hive.box<TaskBox>(Constants().tasks);
  static List<TaskBox> getTasksInOrder(List<TaskBox> taskbox) {
    List<TaskBox> TB = taskbox;
    int length = taskbox.length;
    for (int i = 0; i < length; i++) {
      Duration minimum = const Duration();

      TaskBox MinTask = TaskBox();
      for (var element in taskbox) {
        var currentelement = element.time.difference(DateTime.now());
        if (currentelement > minimum) {
          minimum = currentelement;
          MinTask = element;
        }
      }

      TB.add(MinTask);
      taskbox.remove(MinTask);
    }
    return TB;
  }
}
