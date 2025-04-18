part of 'book_bloc.dart';

@freezed
class BookEvent with _$BookEvent {
  const factory BookEvent.getBooks({required int page}) = _GetBooksEvent;
  const factory BookEvent.searchBooks(String query) = _SearchBooks;
  const factory BookEvent.loadMoreBooks() = _LoadMoreBooksEvent;
  const factory BookEvent.toggleFavorite(Book book) = _ToggleFavoriteEvent;
  const factory BookEvent.getFavorites() = _GetFavoritesEvent;
}
