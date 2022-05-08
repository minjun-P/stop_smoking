import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String password;
  @HiveField(2)
  String smokingNum;
  @HiveField(3)
  DateTime createdAt;
  @HiveField(4)
  String id;

  User(
      {required this.name,
      required this.password,
      required this.smokingNum,
      required this.createdAt,
      required this.id});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'smokingNum': smokingNum,
      'createdAt': createdAt
    };
  }

  @override
  String toString() => 'User 객체 - name:$name';

  factory User.fromJson(String id, Map data) {
    return User(
        name: data['name'],
        password: data['password'],
        smokingNum: data['smokingNum'],
        createdAt: (data['createdAt'] as Timestamp).toDate(),
        id: id);
  }
}
