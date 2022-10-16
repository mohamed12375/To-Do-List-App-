import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import '../Boxes/Boxes.dart';
import '../constants/custom_colors.dart';

PreferredSize fullAppbar(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return PreferredSize(
    preferredSize: Size.fromHeight(size.height / 3.5),
    child: NewGradientAppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomPaint(
            painter: CircleOne(),
          ),
          CustomPaint(
            painter: CircleTwo(),
          ),
        ],
      ),
      title: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Mohammed!",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              'you have ${Boxes.getTasks().length} tasks',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 20, 0),
          child: Image.asset("assets/images/image.png"),
        )
      ],
      elevation: 0,
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 85, 56, 213),
          Color.fromARGB(255, 129, 218, 245)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
          decoration: BoxDecoration(
            color: CustomColors.HeaderGreyLight,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Today Reminder',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Meeting with client',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '13.00 PM',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width / 4,
              ),
              Image.asset('assets/images/notification.png', scale: 12),
              Container(
                margin: const EdgeInsets.only(bottom: 80),
                child: const Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

PreferredSize emptyAppbar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(75.0),
    child: NewGradientAppBar(
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomPaint(
            painter: CircleOne(),
          ),
          CustomPaint(
            painter: CircleTwo(),
          ),
        ],
      ),
      title: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Hello Mohammed!',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            Text(
              'Today you have no tasks',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 20, 0),
          child: Image.asset('assets/images/image.png'),
        ),
      ],
      elevation: 0,
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [CustomColors.HeaderBlueDark, CustomColors.HeaderBlueLight],
      ),
    ),
  );
}

class CircleOne extends CustomPainter {
  late Paint _paint;

  CircleOne() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(28.0, 0.0), 99.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CircleTwo extends CustomPainter {
  late Paint _paint;

  CircleTwo() {
    _paint = Paint()
      ..color = CustomColors.HeaderCircle
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(const Offset(-30, 20), 50.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
