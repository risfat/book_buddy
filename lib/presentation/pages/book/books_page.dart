import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book.dart';
import '../../bloc/book/book_bloc.dart';
import '../../widgets/custom_error_widget.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              print("Event received: initial state");
              context.read<BookBloc>().add(const BookEvent.getBooks(page: 1));
              return const Center(child: CircularProgressIndicator());
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (books, hasReachedMax) =>
                _buildBookList(context, books, hasReachedMax),
            error: (message) => CustomErrorWidget(errorMessage: message),
          );
        },
      ),
    );
  }

  Widget _buildBookList(
      BuildContext context, List<Book> books, bool hasReachedMax) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo is ScrollEndNotification &&
            scrollInfo.metrics.extentAfter == 0 &&
            !hasReachedMax) {
          context.read<BookBloc>().add(const BookEvent.loadMoreBooks());
        }
        return false;
      },
      child: ListView.builder(
        itemCount: books.length + (hasReachedMax ? 0 : 1),
        itemBuilder: (BuildContext context, int index) {
          if (index >= books.length) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildBookCard(context, books[index]);
        },
      ),
    );
  }

  Widget _buildBookCard(BuildContext context, Book book) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(book.firstName[0]),
        ),
        title: Text('${book.firstName} ${book.lastName}'),
        subtitle: Text(book.email),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to book details page
        },
      ),
    );
  }
}
