import 'package:book_buddy/core/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/params/pagination_params.dart';
import '../../../domain/entities/book.dart';
import '../../../domain/usecases/add_favorites.dart';
import '../../../domain/usecases/get_books.dart';
import '../../../domain/usecases/get_favorites.dart';
import '../../../domain/usecases/remove_favorites.dart';

part 'book_bloc.freezed.dart';
part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBooks getBooks;
  final GetFavorites getFavorites;
  final AddToFavorites addToFavorites;
  final RemoveFavorites removeFromFavorites;
  static const int _booksPerPage = 10;

  BookBloc({
    required this.getBooks,
    required this.getFavorites,
    required this.addToFavorites,
    required this.removeFromFavorites,
  }) : super(const BookState.initial()) {
    on<BookEvent>((event, emit) async {
      await event.map(
        getBooks: (e) => _onGetBooks(e, emit),
        loadMoreBooks: (e) => _onLoadMoreBooks(e, emit),
        toggleFavorite: (e) => _onToggleFavorites(e, emit),
        getFavorites: (e) => _onGetFavorites(e, emit),
      );
    });
  }

  Future<void> _onGetBooks(
      _GetBooksEvent event, Emitter<BookState> emit) async {
    emit(const BookState.loading());
    final failureOrBooks = await getBooks(
        PaginationParams(page: event.page, limit: _booksPerPage));

    if (emit.isDone) return;

    failureOrBooks.fold(
      (failure) => emit(BookState.error(message: failure.message)),
      (books) => emit(BookState.booksLoaded(
        books: books,
        hasReachedMax: books.length < _booksPerPage,
      )),
    );
  }

  Future<void> _onLoadMoreBooks(
      _LoadMoreBooksEvent event, Emitter<BookState> emit) async {
    final currentState = state;
    if (currentState is _BooksLoaded && !currentState.hasReachedMax) {
      final nextPage = (currentState.books.length ~/ _booksPerPage) + 1;
      final failureOrBooks = await getBooks(
          PaginationParams(page: nextPage, limit: _booksPerPage));

      if (emit.isDone) return;

      failureOrBooks.fold(
        (failure) =>
            emit(const BookState.error(message: 'Failed to load more books')),
        (newBooks) => emit(BookState.booksLoaded(
          books: [...currentState.books, ...newBooks],
          hasReachedMax: newBooks.length < _booksPerPage,
        )),
      );
    }
  }

  Future<void> _onToggleFavorites(
      _ToggleFavoriteEvent event, Emitter<BookState> emit) async {
    final currentState = state;
    if (currentState is _BooksLoaded) {
      final updatedBooks = currentState.books.map((book) {
        if (book.id == event.book.id) {
          if (book.isFavorite) {
            removeFromFavorites.call(book);
            return book.copyWith(isFavorite: false);
          } else {
            addToFavorites.call(book);
            return book.copyWith(isFavorite: true);
          }
        }
        return book;
      }).toList();

      emit(BookState.booksLoaded(
        books: updatedBooks,
        hasReachedMax: currentState.hasReachedMax,
      ));
    }
  }

  Future<void> _onGetFavorites(
      _GetFavoritesEvent event, Emitter<BookState> emit) async {
    emit(const BookState.loading());
    final failureOrFavorites = await getFavorites.call(NoParams());

    if (emit.isDone) return;

    failureOrFavorites.fold(
      (failure) => emit(BookState.error(message: failure.message)),
      (favorites) => emit(BookState.favoriteBooksLoaded(
        books: favorites
      )),
    );
  }
}
