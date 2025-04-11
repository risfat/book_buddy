import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utilities/debouncer.dart';
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
  final TextEditingController _searchController = TextEditingController();
  final Debouncer _debouncer = Debouncer(milliseconds: 1000);

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer.cancel();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
        _searchController.clear();
      });

      context.read<BookBloc>().add(
            index == 1
                ? const BookEvent.getFavorites()
                : const BookEvent.getBooks(page: 1),
          );
    }
  }

  void _onSearchChanged(String query) {
    _debouncer.run(() {
      if (query.isEmpty) {
        context.read<BookBloc>().add(const BookEvent.getBooks(page: 1));
      } else {
        context.read<BookBloc>().add(BookEvent.searchBooks(query));
      }
    });
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
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              axis: Axis.horizontal,
              child: child,
            ),
          );
        },
        child: _selectedIndex == 0
            ? Container(
                key: const ValueKey<String>('SearchField'),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search books...',
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, color: Colors.grey),
                            onPressed: () {
                              _searchController.clear();
                              _onSearchChanged('');
                            },
                          )
                        : null,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                  onChanged: _onSearchChanged,
                ),
              )
            : Text(
                'Favorites',
                key: const ValueKey<String>('FavoritesTitle'),
                style: Theme.of(context).textTheme.titleLarge,
              ),
      ),
      actions: [
        if (_selectedIndex == 0)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              _onSearchChanged('');
            },
          ),
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
          booksLoaded: (books, hasReachedMax, isFavoritePage) => _buildBookList(
              books, hasReachedMax,
              isFavoritePage: isFavoritePage),
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
    bool isFavoritePage = false,
  }) {
    if (books.isEmpty) {
      return Center(
        child: Text(
          isFavoritePage ? 'No favorite books found' : 'No books found',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        if (!isFavoritePage) {
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
