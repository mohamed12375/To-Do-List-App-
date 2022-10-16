import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpro/Constants/constans.dart';

import 'package:flutterpro/Services/Notification_Services.dart';
import 'package:provider/provider.dart';

import '../Boxes/TaskBox.dart';
import '../Providers/task_Provider.dart';

import '../constants/custom_colors.dart';
import 'main_buttom_sheet_widget.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({
    super.key,
    required this.name,
    required this.type,
    required this.time,
    required this.task,
    this.status = false,
    // required this.taskScreenState
  });

  final TaskBox task;
  final String name;
  final String type;
  final DateTime time;

  bool status = false;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  late final LocalNotificationService service;
  AudioPlayer audioPlayer = AudioPlayer();

  AssetSource doneAudio = AssetSource('Audio/Done.wav');
  AssetSource notificationAudio = AssetSource('Audio/Notification.mp3');

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();

    //widget.status = await service.notificationStatus(id: widget.task.key);
    service.showScheduledNotification(
        id: widget.task.key,
        title: widget.type,
        body: widget.name,
        timeOfDay: widget.time);

    super.initState();
  }

  // final TaskScreenState taskScreenState;
  @override
  Widget build(BuildContext context) {
    DateTime _fromDate = DateTime(widget.time.year, widget.time.month,
        widget.time.day + 1, 0, 0); //Modefka
    return Consumer<TaskProvider>(
      builder: (context, provider, _) {
        return Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
          padding: const EdgeInsets.fromLTRB(5, 13, 0, 13),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.015, 0.015],
              colors: [
                Constants().colors[Constants().TasksTypes.indexOf(widget.type)],
                Colors.white
              ],
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            boxShadow: const [
              BoxShadow(
                color: CustomColors.GreyBorder,
                blurRadius: 10.0,
                spreadRadius: 5.0,
                offset: Offset(0.0, 0.0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () async {
                  await audioPlayer.play(
                    doneAudio,
                  );
                  print("juy");
                  provider.taskStatus(widget.task);
                },
                icon: Icon(
                  widget.task.isDone
                      ? Icons.check_circle_rounded
                      : Icons.circle_outlined,
                  color: widget.task.isDone ? Colors.green : Colors.grey,
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Text(
                      widget.time.hour.toString().padLeft(2, "0") +
                          ":" +
                          widget.time.minute.toString().padLeft(2, "0"),
                      style: const TextStyle(color: CustomColors.TextGrey),
                    ),
                    Text(
                      dayName(_fromDate.difference(DateTime.now()).inDays),
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width: 160,
                  child: TextButton(
                    onPressed: () {
                      provider.EditTask(
                          widget.task, widget.name, widget.type, widget.time);
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return MainButtomWidget(
                              editing: true,
                              task: widget.task,
                            );
                          });
                    },
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          color: widget.task.isDone
                              ? CustomColors.TextGrey
                              : CustomColors.TextHeader,
                          fontWeight: FontWeight.w600,
                          decoration: widget.task.isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  )),
              IconButton(
                  onPressed: () async {
                    await audioPlayer.play(
                      doneAudio,
                    );
                    provider.deleteTask(widget.task);
                  },
                  icon: const Icon(Icons.delete, color: Colors.grey)),
              IconButton(
                onPressed: () async {
                  //NotificationManager.showNotification(title: widget.name);

                  //await service.notificationStatus(id: widget.task.key);
                  setState(() {
                    provider.taskNotify(widget.task);
                  });

                  widget.task.notify
                      ? service.showScheduledNotification(
                          id: widget.task.key,
                          title: widget.type,
                          body: widget.name,
                          timeOfDay: widget.time)
                      : service.cancleNotification(id: widget.task.key);
                  await audioPlayer.play(notificationAudio, volume: 0.2);
                },
                icon: Icon(Icons.notifications,
                    color: widget.task.notify
                        ? CustomColors.YellowBell
                        : Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }

  String dayName(int days) {
    if (days < -1) {
      return "Ago";
    } else {
      switch (days) {
        case -1:
          return "Yesterday";
        case 0:
          return "Today";
        case 1:
          return "Tommorow";
        case 2:
          return "After Tmr";
        default:
          return "A week";
      }
    }
  }
}
