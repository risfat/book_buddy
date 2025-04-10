import 'package:flutter/material.dart';

import '../../../../domain/entities/book.dart';

class UserList extends StatelessWidget {
  final List<Book> books;

  const UserList({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return ListTile(
          title: Text(book.firstName + '' + book.lastName),
          subtitle: Text(book.email),
          leading: CircleAvatar(
            child: Text(book.firstName[0]),
          ),
        );
      },
    );
  }
}
