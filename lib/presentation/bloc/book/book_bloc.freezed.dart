// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getBooks,
    required TResult Function() loadMoreBooks,
    required TResult Function(Book book) toggleFavorite,
    required TResult Function() getFavorites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getBooks,
    TResult? Function()? loadMoreBooks,
    TResult? Function(Book book)? toggleFavorite,
    TResult? Function()? getFavorites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getBooks,
    TResult Function()? loadMoreBooks,
    TResult Function(Book book)? toggleFavorite,
    TResult Function()? getFavorites,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBooksEvent value) getBooks,
    required TResult Function(_LoadMoreBooksEvent value) loadMoreBooks,
    required TResult Function(_ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(_GetFavoritesEvent value) getFavorites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBooksEvent value)? getBooks,
    TResult? Function(_LoadMoreBooksEvent value)? loadMoreBooks,
    TResult? Function(_ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(_GetFavoritesEvent value)? getFavorites,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBooksEvent value)? getBooks,
    TResult Function(_LoadMoreBooksEvent value)? loadMoreBooks,
    TResult Function(_ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(_GetFavoritesEvent value)? getFavorites,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookEventCopyWith<$Res> {
  factory $BookEventCopyWith(BookEvent value, $Res Function(BookEvent) then) =
      _$BookEventCopyWithImpl<$Res, BookEvent>;
}

/// @nodoc
class _$BookEventCopyWithImpl<$Res, $Val extends BookEvent>
    implements $BookEventCopyWith<$Res> {
  _$BookEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetBooksEventImplCopyWith<$Res> {
  factory _$$GetBooksEventImplCopyWith(
          _$GetBooksEventImpl value, $Res Function(_$GetBooksEventImpl) then) =
      __$$GetBooksEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int page});
}

/// @nodoc
class __$$GetBooksEventImplCopyWithImpl<$Res>
    extends _$BookEventCopyWithImpl<$Res, _$GetBooksEventImpl>
    implements _$$GetBooksEventImplCopyWith<$Res> {
  __$$GetBooksEventImplCopyWithImpl(
      _$GetBooksEventImpl _value, $Res Function(_$GetBooksEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
  }) {
    return _then(_$GetBooksEventImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetBooksEventImpl implements _GetBooksEvent {
  const _$GetBooksEventImpl({required this.page});

  @override
  final int page;

  @override
  String toString() {
    return 'BookEvent.getBooks(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBooksEventImpl &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page);

  /// Create a copy of BookEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBooksEventImplCopyWith<_$GetBooksEventImpl> get copyWith =>
      __$$GetBooksEventImplCopyWithImpl<_$GetBooksEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getBooks,
    required TResult Function() loadMoreBooks,
    required TResult Function(Book book) toggleFavorite,
    required TResult Function() getFavorites,
  }) {
    return getBooks(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getBooks,
    TResult? Function()? loadMoreBooks,
    TResult? Function(Book book)? toggleFavorite,
    TResult? Function()? getFavorites,
  }) {
    return getBooks?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getBooks,
    TResult Function()? loadMoreBooks,
    TResult Function(Book book)? toggleFavorite,
    TResult Function()? getFavorites,
    required TResult orElse(),
  }) {
    if (getBooks != null) {
      return getBooks(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBooksEvent value) getBooks,
    required TResult Function(_LoadMoreBooksEvent value) loadMoreBooks,
    required TResult Function(_ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(_GetFavoritesEvent value) getFavorites,
  }) {
    return getBooks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBooksEvent value)? getBooks,
    TResult? Function(_LoadMoreBooksEvent value)? loadMoreBooks,
    TResult? Function(_ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(_GetFavoritesEvent value)? getFavorites,
  }) {
    return getBooks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBooksEvent value)? getBooks,
    TResult Function(_LoadMoreBooksEvent value)? loadMoreBooks,
    TResult Function(_ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(_GetFavoritesEvent value)? getFavorites,
    required TResult orElse(),
  }) {
    if (getBooks != null) {
      return getBooks(this);
    }
    return orElse();
  }
}

abstract class _GetBooksEvent implements BookEvent {
  const factory _GetBooksEvent({required final int page}) = _$GetBooksEventImpl;

  int get page;

  /// Create a copy of BookEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBooksEventImplCopyWith<_$GetBooksEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreBooksEventImplCopyWith<$Res> {
  factory _$$LoadMoreBooksEventImplCopyWith(_$LoadMoreBooksEventImpl value,
          $Res Function(_$LoadMoreBooksEventImpl) then) =
      __$$LoadMoreBooksEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreBooksEventImplCopyWithImpl<$Res>
    extends _$BookEventCopyWithImpl<$Res, _$LoadMoreBooksEventImpl>
    implements _$$LoadMoreBooksEventImplCopyWith<$Res> {
  __$$LoadMoreBooksEventImplCopyWithImpl(_$LoadMoreBooksEventImpl _value,
      $Res Function(_$LoadMoreBooksEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMoreBooksEventImpl implements _LoadMoreBooksEvent {
  const _$LoadMoreBooksEventImpl();

  @override
  String toString() {
    return 'BookEvent.loadMoreBooks()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreBooksEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getBooks,
    required TResult Function() loadMoreBooks,
    required TResult Function(Book book) toggleFavorite,
    required TResult Function() getFavorites,
  }) {
    return loadMoreBooks();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getBooks,
    TResult? Function()? loadMoreBooks,
    TResult? Function(Book book)? toggleFavorite,
    TResult? Function()? getFavorites,
  }) {
    return loadMoreBooks?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getBooks,
    TResult Function()? loadMoreBooks,
    TResult Function(Book book)? toggleFavorite,
    TResult Function()? getFavorites,
    required TResult orElse(),
  }) {
    if (loadMoreBooks != null) {
      return loadMoreBooks();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBooksEvent value) getBooks,
    required TResult Function(_LoadMoreBooksEvent value) loadMoreBooks,
    required TResult Function(_ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(_GetFavoritesEvent value) getFavorites,
  }) {
    return loadMoreBooks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBooksEvent value)? getBooks,
    TResult? Function(_LoadMoreBooksEvent value)? loadMoreBooks,
    TResult? Function(_ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(_GetFavoritesEvent value)? getFavorites,
  }) {
    return loadMoreBooks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBooksEvent value)? getBooks,
    TResult Function(_LoadMoreBooksEvent value)? loadMoreBooks,
    TResult Function(_ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(_GetFavoritesEvent value)? getFavorites,
    required TResult orElse(),
  }) {
    if (loadMoreBooks != null) {
      return loadMoreBooks(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreBooksEvent implements BookEvent {
  const factory _LoadMoreBooksEvent() = _$LoadMoreBooksEventImpl;
}

/// @nodoc
abstract class _$$ToggleFavoriteEventImplCopyWith<$Res> {
  factory _$$ToggleFavoriteEventImplCopyWith(_$ToggleFavoriteEventImpl value,
          $Res Function(_$ToggleFavoriteEventImpl) then) =
      __$$ToggleFavoriteEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Book book});
}

/// @nodoc
class __$$ToggleFavoriteEventImplCopyWithImpl<$Res>
    extends _$BookEventCopyWithImpl<$Res, _$ToggleFavoriteEventImpl>
    implements _$$ToggleFavoriteEventImplCopyWith<$Res> {
  __$$ToggleFavoriteEventImplCopyWithImpl(_$ToggleFavoriteEventImpl _value,
      $Res Function(_$ToggleFavoriteEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
  }) {
    return _then(_$ToggleFavoriteEventImpl(
      null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
    ));
  }
}

/// @nodoc

class _$ToggleFavoriteEventImpl implements _ToggleFavoriteEvent {
  const _$ToggleFavoriteEventImpl(this.book);

  @override
  final Book book;

  @override
  String toString() {
    return 'BookEvent.toggleFavorite(book: $book)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleFavoriteEventImpl &&
            (identical(other.book, book) || other.book == book));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book);

  /// Create a copy of BookEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleFavoriteEventImplCopyWith<_$ToggleFavoriteEventImpl> get copyWith =>
      __$$ToggleFavoriteEventImplCopyWithImpl<_$ToggleFavoriteEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getBooks,
    required TResult Function() loadMoreBooks,
    required TResult Function(Book book) toggleFavorite,
    required TResult Function() getFavorites,
  }) {
    return toggleFavorite(book);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getBooks,
    TResult? Function()? loadMoreBooks,
    TResult? Function(Book book)? toggleFavorite,
    TResult? Function()? getFavorites,
  }) {
    return toggleFavorite?.call(book);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getBooks,
    TResult Function()? loadMoreBooks,
    TResult Function(Book book)? toggleFavorite,
    TResult Function()? getFavorites,
    required TResult orElse(),
  }) {
    if (toggleFavorite != null) {
      return toggleFavorite(book);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBooksEvent value) getBooks,
    required TResult Function(_LoadMoreBooksEvent value) loadMoreBooks,
    required TResult Function(_ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(_GetFavoritesEvent value) getFavorites,
  }) {
    return toggleFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBooksEvent value)? getBooks,
    TResult? Function(_LoadMoreBooksEvent value)? loadMoreBooks,
    TResult? Function(_ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(_GetFavoritesEvent value)? getFavorites,
  }) {
    return toggleFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBooksEvent value)? getBooks,
    TResult Function(_LoadMoreBooksEvent value)? loadMoreBooks,
    TResult Function(_ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(_GetFavoritesEvent value)? getFavorites,
    required TResult orElse(),
  }) {
    if (toggleFavorite != null) {
      return toggleFavorite(this);
    }
    return orElse();
  }
}

abstract class _ToggleFavoriteEvent implements BookEvent {
  const factory _ToggleFavoriteEvent(final Book book) =
      _$ToggleFavoriteEventImpl;

  Book get book;

  /// Create a copy of BookEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleFavoriteEventImplCopyWith<_$ToggleFavoriteEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetFavoritesEventImplCopyWith<$Res> {
  factory _$$GetFavoritesEventImplCopyWith(_$GetFavoritesEventImpl value,
          $Res Function(_$GetFavoritesEventImpl) then) =
      __$$GetFavoritesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetFavoritesEventImplCopyWithImpl<$Res>
    extends _$BookEventCopyWithImpl<$Res, _$GetFavoritesEventImpl>
    implements _$$GetFavoritesEventImplCopyWith<$Res> {
  __$$GetFavoritesEventImplCopyWithImpl(_$GetFavoritesEventImpl _value,
      $Res Function(_$GetFavoritesEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetFavoritesEventImpl implements _GetFavoritesEvent {
  const _$GetFavoritesEventImpl();

  @override
  String toString() {
    return 'BookEvent.getFavorites()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetFavoritesEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page) getBooks,
    required TResult Function() loadMoreBooks,
    required TResult Function(Book book) toggleFavorite,
    required TResult Function() getFavorites,
  }) {
    return getFavorites();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int page)? getBooks,
    TResult? Function()? loadMoreBooks,
    TResult? Function(Book book)? toggleFavorite,
    TResult? Function()? getFavorites,
  }) {
    return getFavorites?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page)? getBooks,
    TResult Function()? loadMoreBooks,
    TResult Function(Book book)? toggleFavorite,
    TResult Function()? getFavorites,
    required TResult orElse(),
  }) {
    if (getFavorites != null) {
      return getFavorites();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBooksEvent value) getBooks,
    required TResult Function(_LoadMoreBooksEvent value) loadMoreBooks,
    required TResult Function(_ToggleFavoriteEvent value) toggleFavorite,
    required TResult Function(_GetFavoritesEvent value) getFavorites,
  }) {
    return getFavorites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBooksEvent value)? getBooks,
    TResult? Function(_LoadMoreBooksEvent value)? loadMoreBooks,
    TResult? Function(_ToggleFavoriteEvent value)? toggleFavorite,
    TResult? Function(_GetFavoritesEvent value)? getFavorites,
  }) {
    return getFavorites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBooksEvent value)? getBooks,
    TResult Function(_LoadMoreBooksEvent value)? loadMoreBooks,
    TResult Function(_ToggleFavoriteEvent value)? toggleFavorite,
    TResult Function(_GetFavoritesEvent value)? getFavorites,
    required TResult orElse(),
  }) {
    if (getFavorites != null) {
      return getFavorites(this);
    }
    return orElse();
  }
}

abstract class _GetFavoritesEvent implements BookEvent {
  const factory _GetFavoritesEvent() = _$GetFavoritesEventImpl;
}

/// @nodoc
mixin _$BookState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Book> books, bool hasReachedMax, bool isFavorite)
        booksLoaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Book> books, bool hasReachedMax, bool isFavorite)?
        booksLoaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Book> books, bool hasReachedMax, bool isFavorite)?
        booksLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BooksLoaded value) booksLoaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BooksLoaded value)? booksLoaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookStateCopyWith<$Res> {
  factory $BookStateCopyWith(BookState value, $Res Function(BookState) then) =
      _$BookStateCopyWithImpl<$Res, BookState>;
}

/// @nodoc
class _$BookStateCopyWithImpl<$Res, $Val extends BookState>
    implements $BookStateCopyWith<$Res> {
  _$BookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BookStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'BookState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Book> books, bool hasReachedMax, bool isFavorite)
        booksLoaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Book> books, bool hasReachedMax, bool isFavorite)?
        booksLoaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Book> books, bool hasReachedMax, bool isFavorite)?
        booksLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BooksLoaded value) booksLoaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BooksLoaded value)? booksLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BookState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$BookStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'BookState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Book> books, bool hasReachedMax, bool isFavorite)
        booksLoaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Book> books, bool hasReachedMax, bool isFavorite)?
        booksLoaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Book> books, bool hasReachedMax, bool isFavorite)?
        booksLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BooksLoaded value) booksLoaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BooksLoaded value)? booksLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BookState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$BooksLoadedImplCopyWith<$Res> {
  factory _$$BooksLoadedImplCopyWith(
          _$BooksLoadedImpl value, $Res Function(_$BooksLoadedImpl) then) =
      __$$BooksLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Book> books, bool hasReachedMax, bool isFavorite});
}

/// @nodoc
class __$$BooksLoadedImplCopyWithImpl<$Res>
    extends _$BookStateCopyWithImpl<$Res, _$BooksLoadedImpl>
    implements _$$BooksLoadedImplCopyWith<$Res> {
  __$$BooksLoadedImplCopyWithImpl(
      _$BooksLoadedImpl _value, $Res Function(_$BooksLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
    Object? hasReachedMax = null,
    Object? isFavorite = null,
  }) {
    return _then(_$BooksLoadedImpl(
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>,
      hasReachedMax: null == hasReachedMax
          ? _value.hasReachedMax
          : hasReachedMax // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BooksLoadedImpl implements _BooksLoaded {
  const _$BooksLoadedImpl(
      {required final List<Book> books,
      required this.hasReachedMax,
      this.isFavorite = false})
      : _books = books;

  final List<Book> _books;
  @override
  List<Book> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  final bool hasReachedMax;
  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'BookState.booksLoaded(books: $books, hasReachedMax: $hasReachedMax, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksLoadedImpl &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            (identical(other.hasReachedMax, hasReachedMax) ||
                other.hasReachedMax == hasReachedMax) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_books), hasReachedMax, isFavorite);

  /// Create a copy of BookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksLoadedImplCopyWith<_$BooksLoadedImpl> get copyWith =>
      __$$BooksLoadedImplCopyWithImpl<_$BooksLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Book> books, bool hasReachedMax, bool isFavorite)
        booksLoaded,
    required TResult Function(String message) error,
  }) {
    return booksLoaded(books, hasReachedMax, isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Book> books, bool hasReachedMax, bool isFavorite)?
        booksLoaded,
    TResult? Function(String message)? error,
  }) {
    return booksLoaded?.call(books, hasReachedMax, isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Book> books, bool hasReachedMax, bool isFavorite)?
        booksLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (booksLoaded != null) {
      return booksLoaded(books, hasReachedMax, isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BooksLoaded value) booksLoaded,
    required TResult Function(_Error value) error,
  }) {
    return booksLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BooksLoaded value)? booksLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return booksLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (booksLoaded != null) {
      return booksLoaded(this);
    }
    return orElse();
  }
}

abstract class _BooksLoaded implements BookState {
  const factory _BooksLoaded(
      {required final List<Book> books,
      required final bool hasReachedMax,
      final bool isFavorite}) = _$BooksLoadedImpl;

  List<Book> get books;
  bool get hasReachedMax;
  bool get isFavorite;

  /// Create a copy of BookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BooksLoadedImplCopyWith<_$BooksLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$BookStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'BookState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of BookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<Book> books, bool hasReachedMax, bool isFavorite)
        booksLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Book> books, bool hasReachedMax, bool isFavorite)?
        booksLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Book> books, bool hasReachedMax, bool isFavorite)?
        booksLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BooksLoaded value) booksLoaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_BooksLoaded value)? booksLoaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BooksLoaded value)? booksLoaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements BookState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of BookState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
