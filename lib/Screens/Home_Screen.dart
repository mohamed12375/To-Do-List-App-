import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutterpro/Boxes/Boxes.dart';
import 'package:flutterpro/Widgets/Task_Widget.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../Boxes/TaskBox.dart';
import '../Providers/task_Provider.dart';
import '../constants/custom_colors.dart';
import '../widgets/app_bars.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _EmptyState();
}

class _EmptyState extends State<HomeScreen> {
  var bottomNavigationBarIndex = 0;
  // AssetSource backGroundAudio = AssetSource('Audio/Background.mp3');
  // AudioPlayer backGroundPlayer = AudioPlayer();
  // late TextEditingController namecontroller;
  // DateTime _fromDate = DateTime.now();
  // Color currentcolor = Colors.white;

  // String type = "";

  @override
  void initState() {
    // initiateMusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<TaskProvider>(builder: (context, provider, _) {
      return provider.getTasks().length == 0
          ? Scaffold(
              appBar: emptyAppbar(),
              body: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 8,
                        child: Hero(
                          tag: 'Clipboard',
                          child:
                              Image.asset('assets/images/Clipboard-empty.png'),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: const [
                            Text(
                              'No tasks',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: CustomColors.TextHeader),
                            ),
                            SizedBox(height: 15),
                            Text(
                              'You have no tasks to do.',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: CustomColors.TextBody,
                                  fontFamily: 'opensans'),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      )
                    ],
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: customFab(context),
              bottomNavigationBar:
                  BottomNavigationBarApp(context, bottomNavigationBarIndex),
            )
          : WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Scaffold(
                appBar: fullAppbar(context),
                body: Column(
                  children: <Widget>[
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 20, bottom: 15),
                      child: const Text(
                        'Tasks',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.TextSubHeader),
                      ),
                    ),
                    // TaskWidget(name: name, type: type, time: time, task: task, taskScreenState: taskScreenState)
                    ValueListenableBuilder(
                      valueListenable: provider.getTasks().listenable(),
                      builder: (BuildContext context, box, _) {
                        final taskbox = box.values.toList().cast<TaskBox>();
                        taskbox.sort((a, b) => a.time.compareTo(b.time));
                        // Boxes.getTasksInOrder(TB);
                        return Expanded(
                          child: ListView.builder(
                            itemCount: taskbox.length,
                            itemBuilder: ((context, index) {
                              return TaskWidget(
                                name: taskbox[index].Name,
                                type: taskbox[index].Type,
                                time: taskbox[index].time,
                                task: taskbox[index],
                              );
                            }),
                          ),
                        );
                      },
                    ),

                    // const SizedBox(height: 15)
                  ],
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerDocked,
                floatingActionButton: customFab(context),
                bottomNavigationBar:
                    BottomNavigationBarApp(context, bottomNavigationBarIndex),
              ));
    });
  }

  // void initiateMusic() async {
  //   await backGroundPlayer.play(backGroundAudio, volume: 0.01);
  // }
}
