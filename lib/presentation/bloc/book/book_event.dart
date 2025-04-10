part of 'book_bloc.dart';

@freezed
class BookEvent with _$BookEvent {
  const factory BookEvent.getBooks({required int page}) = _GetBooksEvent;
  const factory BookEvent.loadMoreBooks() = _LoadMoreBooksEvent;
}
