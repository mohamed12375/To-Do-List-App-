import 'package:flutter/material.dart';
import 'package:flutterpro/Screens/Home_Screen.dart';
import 'package:flutterpro/Screens/task_screen.dart';

import '../constants/custom_colors.dart';
// import '../screens/task_screen.dart';

class BottomNavigationBarApp extends StatelessWidget {
  final int bottomNavigationBarIndex;
  final BuildContext context;

  const BottomNavigationBarApp(this.context, this.bottomNavigationBarIndex,
      {super.key});

  void onTabTapped(int index) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return (index == 1)
            ? const Task()
            : const HomeScreen(); // replace home with task
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: bottomNavigationBarIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      selectedLabelStyle: const TextStyle(color: CustomColors.BlueDark),
      selectedItemColor: CustomColors.BlueDark,
      unselectedFontSize: 10,
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'assets/images/home.png',
              color: (bottomNavigationBarIndex == 0)
                  ? CustomColors.BlueDark
                  : CustomColors.TextGrey,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'assets/images/task.png',
              color: (bottomNavigationBarIndex == 1)
                  ? CustomColors.BlueDark
                  : CustomColors.TextGrey,
            ),
          ),
          label: 'Task',
        ),
      ],
      onTap: onTabTapped,
    );
  }
}
