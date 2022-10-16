import 'package:hive/hive.dart';
part 'Adaptors/TaskBox.g.dart';
// part 'TaskBox.g.dart';

@HiveType(typeId: 0, adapterName: 'TaskBoxAdaptor')
class TaskBox extends HiveObject {
  @HiveField(0)
  late String Name;

  @HiveField(1)
  late String Type;

  @HiveField(2)
  late DateTime time;

  @HiveField(3)
  late bool isDone;

  @HiveField(4)
  late bool notify;
}
