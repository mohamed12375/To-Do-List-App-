import 'package:flutter/material.dart';
import '../constants/custom_colors.dart';
import '../widgets/app_bars.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/fab.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final bottomNavigationBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullAppbar(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Container(
                        margin:
                            const EdgeInsets.only(left: 10, top: 15, bottom: 0),
                        child: const Text(
                          'Projects',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: CustomColors.TextSubHeader),
                        ),
                      ),
                  childCount: 1),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreyBorder,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(10),
                    height: 150.0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                              color: CustomColors.YellowBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            child: Image.asset('assets/images/icon-user.png'),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Personal',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '24 Tasks',
                            style: TextStyle(
                                fontSize: 9,
                                color: CustomColors.TextSubHeaderGrey),
                          ),
                        ],
                      ),
                    )),
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreyBorder,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(10),
                    height: 150.0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                              color: CustomColors.GreenBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            child:
                                Image.asset('assets/images/icon-briefcase.png'),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Work',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '44 Tasks',
                            style: TextStyle(
                                fontSize: 9,
                                color: CustomColors.TextSubHeaderGrey),
                          ),
                        ],
                      ),
                    )),
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreyBorder,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(10),
                    height: 150.0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                              color: CustomColors.PurpleBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            child: Image.asset(
                                'assets/images/icon-presentation.png'),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Meeting',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '45 Tasks',
                            style: TextStyle(
                                fontSize: 9,
                                color: CustomColors.TextSubHeaderGrey),
                          ),
                        ],
                      ),
                    )),
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreyBorder,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(10),
                    height: 150.0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                              color: CustomColors.OrangeBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            child: Image.asset(
                                'assets/images/icon-shopping-basket.png'),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Shopping',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '54 Tasks',
                            style: TextStyle(
                                fontSize: 9,
                                color: CustomColors.TextSubHeaderGrey),
                          ),
                        ],
                      ),
                    )),
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreyBorder,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(10),
                    height: 150.0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                              color: CustomColors.BlueBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            child:
                                Image.asset('assets/images/icon-confetti.png'),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Party',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '24 Tasks',
                            style: TextStyle(
                                fontSize: 9,
                                color: CustomColors.TextSubHeaderGrey),
                          ),
                        ],
                      ),
                    )),
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.GreyBorder,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(10),
                    height: 150.0,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 65,
                            height: 65,
                            decoration: const BoxDecoration(
                              color: CustomColors.PurpleBackground,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0),
                              ),
                            ),
                            child:
                                Image.asset('assets/images/icon-molecule.png'),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Study',
                            style: TextStyle(
                                fontSize: 17,
                                color: CustomColors.TextHeaderGrey,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            '24 Tasks',
                            style: TextStyle(
                                fontSize: 9,
                                color: CustomColors.TextSubHeaderGrey),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFab(context),
      bottomNavigationBar:
          BottomNavigationBarApp(context, bottomNavigationBarIndex),
    );
  }
}
