import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:flutter/material.dart';
import 'package:flutterpro/Widgets/main_buttom_sheet_widget.dart';
import 'package:provider/provider.dart';

import '../Constants/constans.dart';
import '../Providers/task_Provider.dart';
import '../constants/custom_colors.dart';

Consumer customFab(context) {
  return Consumer<TaskProvider>(
    builder: (context, provider, _) {
      return FloatingActionButton(
        onPressed: () {
          //modal.mainBottomSheet(context);

          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return MainButtomWidget(
                  editing: false,
                );
              });

          // showDialog(
          //   context: context,
          //   builder: (context) => AddTask(provider),
          // );
        },
        elevation: 5,
        backgroundColor: Colors.transparent,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
      );
    },
  );
}
