import 'package:flutter/material.dart';
import 'package:flutterpro/Boxes/TaskBox.dart';
import 'package:flutterpro/Constants/constans.dart';
import 'package:flutterpro/Providers/task_Provider.dart';
import 'package:flutterpro/Screens/Home_Screen.dart';
import 'package:flutterpro/Screens/new_onboarding.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:flutter_app/screens/new_onboarding.dart';
import 'package:flutter/services.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter((TaskBoxAdaptor()));
  // Hive.deleteBoxFromDisk(Constants().tasks);

  await Hive.openBox<TaskBox>(Constants().tasks);
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final introData = GetStorage();

  @override
  void initState() {
    introData.writeIfNull('displayed', false);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //top bar color
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((_) => TaskProvider()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do App',
        theme: ThemeData(
            canvasColor: const Color.fromRGBO(249, 252, 255, 1),
            fontFamily: 'rubik'),
        home: introData.read('displayed')
            ? const HomeScreen()
            : const IntroPage(), //Intro Screen in Task Screen
      ),
    );
  }
}
