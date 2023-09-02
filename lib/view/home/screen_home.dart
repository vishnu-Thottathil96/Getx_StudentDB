import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentdbgetx/constants/colors.dart';
import 'package:studentdbgetx/constants/screen_size.dart';
import 'package:studentdbgetx/constants/space.dart';
import 'package:studentdbgetx/controller/state_controller/state_controller.dart';
import 'package:studentdbgetx/view/add/screen_add.dart';
import 'package:studentdbgetx/view/home/widgets/card.dart';

final studentListController = Get.put(StateManager());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    studentListController.getFromDb();
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
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      studentListController.searchHelper(value);
                    } else {
                      studentListController.getFromDb();
                    }
                  },
                ),
              ),
              kHeight20,
              /*
               Obx(() {
                return Expanded(
                  child: GridView.builder(
                    itemCount: studentListController.studentListRx.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: ScreenSize.screenHeight / 70,
                      crossAxisSpacing: ScreenSize.screenHeight / 70,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return CardWidget(
                          student: studentListController.studentListRx[index]);
                    },
                  ),
                );
              })
              */
              GetX<StateManager>(builder: (controller) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: controller.studentListRx.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: ScreenSize.screenHeight / 70,
                      crossAxisSpacing: ScreenSize.screenHeight / 70,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return CardWidget(
                          student: controller.studentListRx[index]);
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
