import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final int age;
  final String gender;

  Book({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
    required this.gender,
  });

  @override
  List<Object> get props => [id, firstName, lastName, email, age, gender];
}
