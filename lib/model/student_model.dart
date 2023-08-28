// class StudentModel {
//   int? id;
//   String image;
//   String name;
//   String batch;
//   String phone;
//   String mail;
//   String address;
//   StudentModel({
//     this.id,
//     required this.address,
//     required this.batch,
//     required this.image,
//     required this.mail,
//     required this.name,
//     required this.phone,
//   });
//   factory StudentModel.fromMap(Map<String, dynamic> map) {
//     return StudentModel(
//       id: map['id'],
//       address: map['address'],
//       batch: map['batch'],
//       image: map['image'],
//       mail: map['email'],
//       name: map['name'],
//       phone: map['mobile'],
//     );
//   }
// }
class StudentModel {
  int? id;
  String image;
  String name;
  String batch;
  String phone;
  String mail;
  String address;

  StudentModel({
    this.id,
    required this.address,
    required this.batch,
    required this.image,
    required this.mail,
    required this.name,
    required this.phone,
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      address: map['address'],
      batch: map['batch'],
      image: map['image'],
      mail: map['email'],
      name: map['name'],
      phone: map['mobile'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'batch': batch,
      'phone': phone,
      'mail': mail,
      'address': address,
    };
  }
}
