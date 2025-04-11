import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String id;
  final String title;
  final List<String> authors;
  final String coverImageUrl;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.coverImageUrl,
  });

  @override
  List<Object> get props => [id, title, authors, coverImageUrl];
}
