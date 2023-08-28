import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentdbgetx/constants/colors.dart';
import 'package:studentdbgetx/constants/screen_size.dart';
import 'package:studentdbgetx/constants/space.dart';
import 'package:studentdbgetx/controller/db_functions.dart';
import 'package:studentdbgetx/view/add/screen_add.dart';
import 'package:studentdbgetx/view/home/widgets/card.dart';

import '../../model/student_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  getStudentsFromDB() async {
    studentListNotifier.value = await DB.instance.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    getStudentsFromDB();
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: themeColor,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddScreen(),
              ));
        },
        child: const Icon(
          CupertinoIcons.person_badge_plus,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.all(ScreenSize.screenHeight / 70),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: ScreenSize.screenHeight / 17,
                child: CupertinoSearchTextField(
                  controller: searchController,
                ),
              ),
              kHeight20,
              ValueListenableBuilder(
                  valueListenable: studentListNotifier,
                  builder: (context, value, _) {
                    return Expanded(
                      child: GridView.builder(
                        itemCount: value.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: ScreenSize.screenHeight / 70,
                          crossAxisSpacing: ScreenSize.screenHeight / 70,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return CardWidget(student: value[index]);
                        },
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
