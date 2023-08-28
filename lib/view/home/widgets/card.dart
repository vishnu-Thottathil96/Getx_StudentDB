import 'dart:io';
import 'package:flutter/material.dart';
import 'package:studentdbgetx/model/student_model.dart';
import '../../../constants/colors.dart';
import '../../../constants/screen_size.dart';
import '../../full_details/screen_details.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(student: student),
          )),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 143, 120, 244),
                Color.fromARGB(255, 182, 201, 245)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: whiteColor,
                  backgroundImage: FileImage(File(student.image)),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: ScreenSize.screenHeight / 40,
                    bottom: ScreenSize.screenHeight / 270,
                  ),
                  child: Text(
                    student.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
