import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentdbgetx/constants/colors.dart';
import 'package:studentdbgetx/constants/space.dart';
import 'package:studentdbgetx/view/home/screen_home.dart';
import '../../controller/db_functions.dart';
import '../../model/student_model.dart';
import '../../widgets/custom_textfield.dart';

List<String> fieldNames = [
  'Name',
  'Batch',
  'Phone Number',
  'Mail id',
  'Address',
];

class EditScreen extends StatelessWidget {
  EditScreen({Key? key, required this.student}) : super(key: key);

  final StudentModel student;
  XFile? imagePiked;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String imageToUpdate = student.image;
    List<dynamic> currentValues = [
      student.name,
      student.batch,
      student.phone,
      student.mail,
      student.address,
      student.id,
    ];
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                CupertinoIcons.pencil_ellipsis_rectangle,
                size: 35,
              ),
            )
          ],
          backgroundColor: themeColor,
          title: const Text('Edit Details'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              kHeight10,
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: FileImage(File(student.image)),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 90,
                    child: IconButton(
                      onPressed: () async {
                        imagePiked = await _pickImage();
                        if (imagePiked != null) {
                          imageToUpdate = imagePiked!.path;
                        }
                      },
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 35,
                        color: themeColor,
                      ),
                    ),
                  )
                ],
              ),
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
                          initialMessage: currentValues[index],
                          onSavedCallback: (value) {
                            currentValues[index] = value!;
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
            print('button pressed');
            if (!_formKey.currentState!.validate()) {
              return;
            }
            _formKey.currentState!.save();
            print(
                '....................................................................');
            print(currentValues);
            print('imageToUpdate : $imageToUpdate');
            print(
                '....................................................................');

            if (imageToUpdate.isEmpty) {
              return;
            }
            final student = StudentModel(
                name: currentValues[0],
                batch: currentValues[1],
                phone: currentValues[2],
                mail: currentValues[3],
                address: currentValues[4],
                image: imageToUpdate,
                id: currentValues[5]);
            print('student id : ${student.id}');

            await studentListController.updateFromDb(student, student.id!);
            Get.showSnackbar(const GetSnackBar(
              title: 'Successful',
              message: 'Data Updated Successfully',
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
            ));

            // _formKey.currentState!.reset();
            Navigator.pop(context);
          },
          child: const Icon(Icons.check),
        ));
  }

  _pickImage() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      if (pick == null) {
        return Exception('no image selected');
      }
      return pick;
    } catch (e) {
      return Exception(e);
    }
  }
}
