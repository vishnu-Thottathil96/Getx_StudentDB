import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentdbgetx/model/student_model.dart';
import 'package:studentdbgetx/view/edit/screen_edit.dart';
import '../../../constants/colors.dart';
import '../../../constants/screen_size.dart';
import '../../../constants/space.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/edit_button.dart';

class UpperSection extends StatelessWidget {
  const UpperSection({
    super.key,
    required this.data,
  });
  final StudentModel data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ScreenSize.screenWidth / 80),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(100),
          ),
          color: themeColor,
        ),
        height: ScreenSize.screenHeight / 3,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 20),
                  child: CircleAvatar(
                      radius: 70,
                      backgroundColor: whiteColor,
                      backgroundImage: FileImage(File(data.image))),
                ),
                kWidth30,
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    '${data.name}\n${data.batch}'.toUpperCase(),
                    style: const TextStyle(color: whiteColor, fontSize: 20),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: EditButtonWidget(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(
                            student: data,
                          ),
                        ));
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BackButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Profile',
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
