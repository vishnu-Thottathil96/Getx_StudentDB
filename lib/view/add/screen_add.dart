import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentdbgetx/constants/colors.dart';
import 'package:studentdbgetx/constants/space.dart';
import 'package:studentdbgetx/view/home/screen_home.dart';
import '../../model/student_model.dart';
import '../../widgets/circle_add.dart';
import '../../widgets/custom_textfield.dart';

List<String> fieldNames = [
  'Name',
  'Batch',
  'Phone Number',
  'Mail id',
  'Address',
];
//ValueNotifier<String> imageNotifier = ValueNotifier('');

class AddScreen extends StatelessWidget {
  AddScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final List<String> toSaveValues =
      List.generate(fieldNames.length, (index) => '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                CupertinoIcons.person_add,
                size: 35,
              ),
            )
          ],
          backgroundColor: themeColor,
          title: const Text('Add Student'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              kHeight10,
              CircleAvatarWithAddButton(),
              kHeight10,
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView.builder(
                    itemCount: fieldNames.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: CustomTextField(
                          hintTextToDisplay: fieldNames[index],
                          onSavedCallback: (value) {
                            toSaveValues[index] = value!;
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: themeColor,
          onPressed: () async {
            if (!_formKey.currentState!.validate()) {
              return;
            }
            _formKey.currentState!.save();
            if (selectedImage.isEmpty) {
              Get.showSnackbar(const GetSnackBar(
                title: 'Image required',
                message: 'Please upload an image',
                duration: Duration(seconds: 2),
                backgroundColor: Colors.red,
              ));
              return;
            }
            final student = StudentModel(
              name: toSaveValues[0],
              batch: toSaveValues[1],
              phone: toSaveValues[2],
              mail: toSaveValues[3],
              address: toSaveValues[4],
              image: selectedImage,
            );

            await studentListController.addToDb(student);
            selectedImage = '';
            Get.showSnackbar(const GetSnackBar(
              title: 'Successful',
              message: 'User Registered Successfully',
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
            ));
            //  imageNotifier.value = 'assets/images/defaultprofile.png';
            _formKey.currentState!.reset();
            Navigator.pop(context);
          },
          child: const Icon(Icons.check),
        ));
  }
}
