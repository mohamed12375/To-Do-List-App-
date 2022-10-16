import 'package:audioplayers/audioplayers.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutterpro/Boxes/TaskBox.dart';
import 'package:provider/provider.dart';

import '../Constants/constans.dart';
import '../Constants/custom_colors.dart';
import '../Providers/task_Provider.dart';
import '../Screens/Home_Screen.dart';
import 'package:intl/intl.dart';

TimeOfDay time = TimeOfDay.now();
DateTime _fromDate = DateTime.now();
Color currentcolor = Colors.white;
String type = "";

class MainButtomWidget extends StatefulWidget {
  MainButtomWidget({super.key, required this.editing, this.task});
  final bool editing;
  TaskBox? task;

  @override
  State<MainButtomWidget> createState() => _MainButtomWidgetState();
}

class _MainButtomWidgetState extends State<MainButtomWidget> {
  TextEditingController nameController = TextEditingController();
  AudioPlayer audioPlayer = AudioPlayer();
  AssetSource addTaskAudio = AssetSource('Audio/Add_Task.wav');

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(
        text: widget.task == null ? "" : widget.task!.Name);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, provider, _) {
      return Container(
        height: MediaQuery.of(context).size.height - 80,
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height / 25,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(175, 30),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2 - 340,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color.fromARGB(255, 9, 190, 231),
                            Color.fromARGB(255, 36, 139, 217),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: CustomColors.PurpleShadow,
                        //     blurRadius: 10.0,
                        //     spreadRadius: 5.0,
                        //     offset: Offset(0.0, 0.0),
                        //   ),
                        // ],
                      ),
                      child: Image.asset('assets/images/fab-add.png'),
                    ),
                  ),
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        const Text(
                          'Add new task',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: TextFormField(
                            autofocus: true,
                            controller: nameController,
                            //controller: nameController,
                            style: const TextStyle(
                                fontSize: 22, fontStyle: FontStyle.normal),
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 90,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 1.0,
                                color: CustomColors.GreyBorder,
                              ),
                              bottom: BorderSide(
                                width: 1.0,
                                color: CustomColors.GreyBorder,
                              ),
                            ),
                          ),
                          child: Types(setState, provider),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: const Text(
                            'Choose The Day',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: dateTimeFunction(setState, provider)),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          child: const Text(
                            'Choose The Time',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                width: 1.0,
                                color: CustomColors.GreyBorder,
                              ),
                              bottom: BorderSide(
                                width: 1.0,
                                color: CustomColors.GreyBorder,
                              ),
                            ),
                          ),
                          child: const TimePickerWidget(),
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width / 1.2,

                        // ),

                        const SizedBox(height: 10),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     subTasks.add('New subtask');
                        //   },
                        //   child: Container(
                        //     width: 120,
                        //     height: 40,
                        //     decoration: const BoxDecoration(
                        //       borderRadius: BorderRadius.all(
                        //         Radius.circular(8.0),
                        //       ),
                        //     ),
                        //     padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        //     child: const Center(
                        //       child: Text(
                        //         'Add subtask',
                        //         style: TextStyle(
                        //             fontSize: 12, fontWeight: FontWeight.w500),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 10),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width / 1.2,
                        //   height: 150,
                        //   child: ListView.builder(
                        //     itemCount: subTasks.length,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return Container(
                        //         margin: const EdgeInsets.only(bottom: 5.0),
                        //         child: TextFormField(
                        //           initialValue: subTasks[index],
                        //           autofocus: false,
                        //           style: TextStyle(
                        //             fontSize: 18,
                        //             fontStyle: FontStyle.normal,
                        //             color: Colors.grey[850],
                        //           ),
                        //           decoration: const InputDecoration(
                        //             border: InputBorder.none,
                        //             enabledBorder: OutlineInputBorder(
                        //               borderSide: BorderSide(
                        //                 color: Colors.grey,
                        //                 width: 1.0,
                        //               ),
                        //               borderRadius: BorderRadius.all(
                        //                 Radius.circular(50.0),
                        //               ),
                        //             ),
                        //             focusedBorder: OutlineInputBorder(
                        //               borderSide: BorderSide(
                        //                 color: Colors.blue,
                        //                 width: 2.0,
                        //               ),
                        //               borderRadius: BorderRadius.all(
                        //                 Radius.circular(50.0),
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () async {
                            await audioPlayer.play(
                              addTaskAudio,
                            );
                            _fromDate = DateTime(
                                _fromDate.year,
                                _fromDate.month,
                                _fromDate.day,
                                time.hour,
                                time.minute);
                            widget.editing
                                ? provider.EditTask(
                                    widget.task!,
                                    nameController.text,
                                    provider.type,
                                    _fromDate)
                                : provider.AddTask(nameController.text,
                                    provider.type, _fromDate);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 60,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: const Center(
                              child: Text(
                                'Add task',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

Widget Types(StateSetter setState, TaskProvider provider) {
  return SizedBox(
    height: 120,
    width: 360,
    child: ListView.builder(
        itemCount: Constants().TasksTypes.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return Card(
              color: Constants().TasksTypes[index] == type
                  ? currentcolor
                  : Colors.white,
              child: TextButton(
                onPressed: () {
                  provider.setType(Constants().TasksTypes[index]);
                  setState(() {
                    type = Constants().TasksTypes[index];
                    currentcolor = Constants().colors[index];
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      color: Constants().colors[index],
                    ),
                    Text(
                      Constants().TasksTypes[index],
                      style: TextStyle(
                          color: type == Constants().TasksTypes[index]
                              ? Colors.white
                              : Colors.grey),
                    ),
                  ],
                ),
              ));
        })),
  );
}

Widget dateTimeFunction(StateSetter setState, TaskProvider provider) {
  return DateTimeField(
    format: DateFormat("yMd"),
    decoration: InputDecoration(
        hintText: "${DateTime.now().month}-${DateTime.now().day}"),
    keyboardType: TextInputType.datetime,
    onSaved: (val) => setState(() => _fromDate = val!),
    onChanged: (newValue) {
      setState(() {
        _fromDate = newValue!;
      });
    },
    onShowPicker: (context, currentValue) {
      return showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime.now().add(new Duration(days: 30)));
    },
  );
}

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: () async {
              TimeOfDay? Tasktime =
                  await showTimePicker(context: context, initialTime: time);

              if (Tasktime == null) {
                return;
              } else {
                setState(() {
                  time = Tasktime;
                });
              }
            },
            child: Text(
              time.hour.toString().padLeft(2, "0") +
                  ":" +
                  time.minute.toString().padLeft(2, "0"),
              style: const TextStyle(
                  color: Color.fromARGB(255, 133, 133, 133), fontSize: 16),
            )),
      ],
    );
  }
}

// String GetTheDayName(int num) {}
