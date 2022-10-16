import 'package:flutter/material.dart';
import 'package:flutterpro/Screens/Home_Screen.dart';
// import 'package:flutter_app/screens/empty.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

final inroData = GetStorage();

void _endWelcomePage(context) {
  Navigator.pop(context);
  Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const HomeScreen())); //Empty Screen
  inroData.write('displayed', true);
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        showDoneButton: true,
        showNextButton: true,
        showSkipButton: true,
        next: const Icon(Icons.navigate_next),
        skip: const Text(
          'Skip',
        ),
        dotsDecorator: DotsDecorator(
          color: Colors.grey,
          size: const Size.square(9.0),
          activeSize: const Size(19.0, 9.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          activeColor: Colors.blue,
        ),
        done: const Text('Done'),
        onDone: () {
          _endWelcomePage(context);
        },
        onSkip: () {
          _endWelcomePage(context);
        },
        pages: [
          PageViewModel(
              image: Image.asset(
                "assets/images/Taking_notes.gif",
                width: 350,
              ),
              title: "Create Your Task",
              body:
                  "Create your task to make sure every task you have can completed on time",
              decoration: const PageDecoration(
                imageFlex: 2,
                bodyFlex: 1,
                imagePadding: EdgeInsets.only(top: 20),
              )),
          PageViewModel(
              image: Image.asset(
                'assets/images/Checklist.gif',
                width: 350,
              ),
              title: "Manage your Daily Task",
              body:
                  "By using this application you will be able to manage your daily tasks",
              decoration: const PageDecoration(
                imageFlex: 2,
                bodyFlex: 1,
                imagePadding: EdgeInsets.only(top: 20),
              )),
          PageViewModel(
              image: Image.asset(
                'assets/images/Writing_letter.gif',
                width: 400,
                height: 350,
              ),
              title: "Checklist Finished Task",
              body:
                  "If you completed your task, so you can view the result you work for each day",
              decoration: const PageDecoration(
                imageFlex: 2,
                bodyFlex: 1,
                imagePadding: EdgeInsets.only(top: 20),
              )),
        ],
      ),
    );
  }
}
