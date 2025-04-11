import 'package:book_buddy/core/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/params/pagination_params.dart';
import '../../../domain/entities/book.dart';
import '../../../domain/usecases/add_favorites.dart';
import '../../../domain/usecases/get_books.dart';
import '../../../domain/usecases/get_favorites.dart';
import '../../../domain/usecases/remove_favorites.dart';
import '../../../domain/usecases/search_books.dart';

part 'book_bloc.freezed.dart';
part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBooks _getBooks;
  final SearchBooks _searchBooks;
  final GetFavorites _getFavorites;
  final AddToFavorites _addToFavorites;
  final RemoveFavorites _removeFromFavorites;
  static const int _booksPerPage = 10;

  BookBloc({
    required GetBooks getBooks,
    required SearchBooks searchBooks,
    required GetFavorites getFavorites,
    required AddToFavorites addToFavorites,
    required RemoveFavorites removeFromFavorites,
  })  : _getBooks = getBooks,
        _searchBooks = searchBooks,
        _getFavorites = getFavorites,
        _addToFavorites = addToFavorites,
        _removeFromFavorites = removeFromFavorites,
        super(const BookState.initial()) {
    on<_GetBooksEvent>(_onGetBooks);
    on<_LoadMoreBooksEvent>(_onLoadMoreBooks);
    on<_ToggleFavoriteEvent>(_onToggleFavorites);
    on<_GetFavoritesEvent>(_onGetFavorites);
    on<_SearchBooks>(_onSearchBooks);
  }

  Future<void> _onGetBooks(
      _GetBooksEvent event, Emitter<BookState> emit) async {
    emit(const BookState.loading());
    final failureOrBooks = await _getBooks(
        PaginationParams(page: event.page, limit: _booksPerPage));

    if (emit.isDone) return;

    emit(failureOrBooks.fold(
      (failure) => BookState.error(message: failure.message),
      (books) => BookState.booksLoaded(
        books: books,
        hasReachedMax: books.length < _booksPerPage,
      ),
    ));
  }

  Future<void> _onLoadMoreBooks(
      _LoadMoreBooksEvent event, Emitter<BookState> emit) async {
    final currentState = state;
    if (currentState is! _BooksLoaded || currentState.hasReachedMax) return;

    final nextPage = (currentState.books.length ~/ _booksPerPage) + 1;
    final failureOrBooks =
        await _getBooks(PaginationParams(page: nextPage, limit: _booksPerPage));

    if (emit.isDone) return;

    emit(failureOrBooks.fold(
      (_) => const BookState.error(message: 'Failed to load more books'),
      (newBooks) => BookState.booksLoaded(
        books: [...currentState.books, ...newBooks],
        hasReachedMax: newBooks.length < _booksPerPage,
      ),
    ));
  }

  void _onSearchBooks(_SearchBooks event, Emitter<BookState> emit) async {
    emit(const BookState.loading());

    final result = await _searchBooks(event.query);
    result.fold(
      (failure) => emit(BookState.error(message: failure.message)),
      (books) => emit(BookState.booksLoaded(
        books: books,
        hasReachedMax: true, // Since we're not paginating search results
        isFavorite: false,
      )),
    );
  }

  Future<void> _onToggleFavorites(
      _ToggleFavoriteEvent event, Emitter<BookState> emit) async {
    final currentState = state;
    if (currentState is! _BooksLoaded) return;

    final updatedBooks = currentState.books.map((book) {
      if (book.id == event.book.id) {
        final isFavorite = !book.isFavorite;
        isFavorite ? _addToFavorites(book) : _removeFromFavorites(book);
        return book.copyWith(isFavorite: isFavorite);
      }
      return book;
    }).toList();

    emit(BookState.booksLoaded(
      books: updatedBooks,
      hasReachedMax: currentState.hasReachedMax,
    ));
  }

  Future<void> _onGetFavorites(
      _GetFavoritesEvent event, Emitter<BookState> emit) async {
    emit(const BookState.loading());
    final failureOrFavorites = await _getFavorites(NoParams());

    if (emit.isDone) return;

    emit(failureOrFavorites.fold(
      (failure) => BookState.error(message: failure.message),
      (favorites) => BookState.booksLoaded(
          books: favorites, hasReachedMax: true, isFavorite: true),
    ));
  }
}
