// import 'package:flutter/material.dart';
// import 'package:studentdbgetx/controller/db_functions.dart';
// import 'package:studentdbgetx/model/student_model.dart';
// import 'package:studentdbgetx/widgets/circle_add.dart';
// import '../../../constants/colors.dart';

// class SaveButton extends StatelessWidget {
//   const SaveButton({
//     super.key,
//     required GlobalKey<FormState> formKey,
//     required this.listtoSaveValues,
//     required this.image,
//     required this.name,
//     required this.batch,
//     required this.phone,
//     required this.mail,
//     required this.address,
//     required this.add,
//   }) : _formKey = formKey;

//   final GlobalKey<FormState> _formKey;
//   final List<String> listtoSaveValues;
//   final bool add;
//   final String image;
//   final String name;
//   final String batch;
//   final String phone;
//   final String mail;
//   final String address;

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       backgroundColor: themeColor,
//       onPressed: () async {
//         if (!_formKey.currentState!.validate()) {
//           print(name);
//           return;
//         }
//         if (selectedImageNotifier.value.isEmpty) {
//           print('image null');
//           return;
//         }
//         final student = StudentModel(
//             address: address,
//             batch: batch,
//             image: selectedImageNotifier.value,
//             mail: mail,
//             name: 'abcd',
//             phone: phone);
//         if (add) {
//           await DB.instance.addStudent(student);
//           print('added');
//         } else {
//           await DB.instance.updateStudent();
//         }
//       },
//       child: const Icon(Icons.check),
//     );
//   }
// }
