import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../domain/entities/book.dart';
import '../../bloc/book/book_bloc.dart';
import '../../widgets/custom_error_widget.dart';
import 'widgets/book_list_item.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Books'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // TODO: Implement search functionality
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        return state.when(
          initial: () => _handleInitialState(context),
          loading: () => _buildShimmerLoading(),
          loaded: (books, hasReachedMax) =>
              _buildBookList(context, books, hasReachedMax),
          error: (message) => CustomErrorWidget(errorMessage: message),
        );
      },
    );
  }

  Widget _handleInitialState(BuildContext context) {
    context.read<BookBloc>().add(const BookEvent.getBooks(page: 1));
    return _buildShimmerLoading();
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 120,
                  color: Colors.white,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 20,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 100,
                        height: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        height: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 80,
                        height: 16,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBookList(
      BuildContext context, List<Book> books, bool hasReachedMax) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<BookBloc>().add(const BookEvent.getBooks(page: 1));
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (_shouldLoadMoreBooks(scrollInfo, hasReachedMax)) {
            context.read<BookBloc>().add(const BookEvent.loadMoreBooks());
          }
          return false;
        },
        child: ListView.builder(
          itemCount: books.length + (hasReachedMax ? 0 : 1),
          itemBuilder: (BuildContext context, int index) {
            if (index >= books.length) {
              return _buildShimmerLoadingItem();
            }
            return BookListItem(
              book: books[index],
              onTap: () => _navigateToBookDetails(context, books[index]),
            );
          },
        ),
      ),
    );
  }

  Widget _buildShimmerLoadingItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 120,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 100,
                    height: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 80,
                    height: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _shouldLoadMoreBooks(ScrollNotification scrollInfo, bool hasReachedMax) {
    return scrollInfo is ScrollEndNotification &&
        scrollInfo.metrics.extentAfter == 0 &&
        !hasReachedMax;
  }

  void _navigateToBookDetails(BuildContext context, Book book) {
    // TODO: Implement navigation to book details page
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => BookDetailsPage(book: book)),
    // );
  }
}