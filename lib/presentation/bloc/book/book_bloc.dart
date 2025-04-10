import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/params/pagination_params.dart';
import '../../../domain/entities/book.dart';
import '../../../domain/usecases/get_books.dart';

part 'book_bloc.freezed.dart';
part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBooks getBooks;
  static const int _booksPerPage = 10;

  BookBloc({required this.getBooks}) : super(const BookState.initial()) {
    on<BookEvent>((event, emit) async {
      await event.map(
        getBooks: (e) => _onGetBooks(e, emit),
        loadMoreBooks: (e) => _onLoadMoreBooks(e, emit),
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
      (books) => emit(BookState.loaded(
        books: books,
        hasReachedMax: books.length < _booksPerPage,
      )),
    );
  }

  Future<void> _onLoadMoreBooks(
      _LoadMoreBooksEvent event, Emitter<BookState> emit) async {
    final currentState = state;
    if (currentState is _Loaded && !currentState.hasReachedMax) {
      final nextPage = (currentState.books.length ~/ _booksPerPage) + 1;
      final failureOrBooks = await getBooks(
          PaginationParams(page: nextPage, limit: _booksPerPage));

      if (emit.isDone) return;

      failureOrBooks.fold(
        (failure) =>
            emit(const BookState.error(message: 'Failed to load more books')),
        (newBooks) => emit(BookState.loaded(
          books: [...currentState.books, ...newBooks],
          hasReachedMax: newBooks.length < _booksPerPage,
        )),
      );
    }
  }
}
