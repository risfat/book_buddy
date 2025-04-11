part of 'book_bloc.dart';

@freezed
class BookState with _$BookState {
  const factory BookState.initial() = _Initial;
  const factory BookState.loading() = _Loading;
  const factory BookState.booksLoaded({
    required List<Book> books,
    required bool hasReachedMax,
  }) = _BooksLoaded;
  const factory BookState.favoriteBooksLoaded({
    required List<Book> books,
  }) = _FavoriteBooksLoaded;
  const factory BookState.error({required String message}) = _Error;
}
