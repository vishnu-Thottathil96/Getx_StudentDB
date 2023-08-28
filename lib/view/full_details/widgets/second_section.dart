import 'package:flutter/material.dart';
import 'package:studentdbgetx/constants/screen_size.dart';
import 'package:studentdbgetx/constants/space.dart';

import '../../../model/student_model.dart';

class SecondSection extends StatelessWidget {
  SecondSection({
    super.key,
    required this.data,
  });
  final StudentModel data;
  final List<String> fields = [
    'PHONE NUMBER:',
    'BATCH:',
    'MAIL ID:',
    'ADDRESS:',
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> records = [
      '+91  ${data.phone}',
      data.batch.toUpperCase(),
      data.mail,
      data.address,
    ];
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenSize.screenHeight / 80,
        left: ScreenSize.screenHeight / 60,
        right: ScreenSize.screenHeight / 60,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: ScreenSize.screenHeight / 90),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fields[index],
                    style: const TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 106, 106, 106)),
                  ),
                  kHeight10,
                ],
              ),
              subtitle: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(text: records[index]),
                  ],
                ),
              ));
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: fields.length,
      ),
    );
  }
}
