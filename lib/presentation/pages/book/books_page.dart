import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../domain/entities/book.dart';
import '../../bloc/book/book_bloc.dart';
import '../../widgets/custom_error_widget.dart';
import 'book_details_page.dart';
import 'widgets/book_list_item.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    context.read<BookBloc>().add(
          index == 1
              ? const BookEvent.getFavorites()
              : const BookEvent.getBooks(page: 1),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_selectedIndex == 0 ? 'Books' : 'Favorites'),
      actions: [
        // Uncomment when search functionality is implemented
        // IconButton(
        //   icon: const Icon(Icons.search),
        //   onPressed: () {
        //     // TODO: Implement search functionality
        //   },
        // ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Books',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  Widget _buildBody() {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        return state.when(
          initial: () => _handleInitialState(),
          loading: _buildShimmerLoading,
          booksLoaded: (books, hasReachedMax) =>
              _buildBookList(books, hasReachedMax),
          favoriteBooksLoaded: (books) =>
              _buildBookList(books, true, pullToRefresh: false),
          error: (message) => CustomErrorWidget(errorMessage: message),
        );
      },
    );
  }

  Widget _handleInitialState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BookBloc>().add(const BookEvent.getBooks(page: 1));
    });
    return _buildShimmerLoading();
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, __) => _buildShimmerLoadingItem(),
    );
  }

  Widget _buildShimmerLoadingItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 16,
                        color: Colors.white,
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookList(
    List<Book> books,
    bool hasReachedMax, {
    bool pullToRefresh = true,
  }) {
    return RefreshIndicator(
      onRefresh: () async {
        if (pullToRefresh) {
          context.read<BookBloc>().add(const BookEvent.getBooks(page: 1));
        }
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
              onTap: () => _navigateToBookDetails(books[index]),
              onFavoriteToggle: () {
                context.read<BookBloc>().add(
                      BookEvent.toggleFavorite(books[index]),
                    );
              },
            );
          },
        ),
      ),
    );
  }

  bool _shouldLoadMoreBooks(ScrollNotification scrollInfo, bool hasReachedMax) {
    return scrollInfo is ScrollEndNotification &&
        scrollInfo.metrics.extentAfter == 0 &&
        !hasReachedMax;
  }

  void _navigateToBookDetails(Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookDetailsPage(book: book)),
    );
  }
}
