import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/config/boxs.dart';
import '../../../core/error/exceptions.dart';
import '../../../domain/entities/book.dart';
import '../../models/book_model.dart';

abstract class BookLocalDataSource {
  Future<List<Book>> getBooks(int page, int limit);
  Future<void> cacheBooks(List<BookModel> books, int page);
  Future<List<Book>> getFavorites();
  Future<void> addToFavorites(Book book);
  Future<void> removeFromFavorites(Book book);
}

class BookLocalDataSourceImpl implements BookLocalDataSource {
  final Box<String> bookBox;

  BookLocalDataSourceImpl({required this.bookBox});

  @override
  Future<List<BookModel>> getBooks(int page, int limit) async {
    final jsonString = bookBox.get(HiveBox.cachedBooksKey);
    if (jsonString != null) {
      try {
        final List<dynamic> jsonList = json.decode(jsonString);
        final allBooks = jsonList
            .map<BookModel>((json) => BookModel.fromGoogleBooksJson(json))
            .toList();

        // Get favorites
        final favorites = await getFavorites();
        final favoriteIds = favorites.map((book) => book.id).toSet();

        // Update isFavorite status for each book
        final updatedBooks = allBooks.map((book) {
          return BookModel.fromBook(
              book.copyWith(isFavorite: favoriteIds.contains(book.id)));
        }).toList();

        // Apply pagination
        final startIndex = (page - 1) * limit;
        final endIndex = startIndex + limit;
        return updatedBooks.sublist(
          startIndex,
          endIndex > updatedBooks.length ? updatedBooks.length : endIndex,
        );
      } catch (e) {
        throw CacheException(
          'Failed to parse cached books data: ${e.toString()}',
        );
      }
    } else {
      throw CacheException('No cached book data found');
    }
  }

  @override
  Future<List<BookModel>> getFavorites() async {
    try {
      final favoritesJson = bookBox.get('favorites');
      if (favoritesJson != null) {
        final List<dynamic> favoritesList = json.decode(favoritesJson);
        return favoritesList.map<BookModel>((json) {
          final book = BookModel.fromGoogleBooksJson(json);
          // Ensure all books retrieved from favorites are marked as favorite
          return BookModel.fromBook(book.copyWith(isFavorite: true));
        }).toList();
      }
    } on Exception catch (e) {
      throw CacheException(
        'Failed to parse favorites data: ${e.toString()}',
      );
    }
    return [];
  }

  @override
  Future<void> addToFavorites(Book book) async {
    final favorites = await getFavorites();
    if (!favorites.any((favBook) => favBook.id == book.id)) {
      final bookModel = BookModel.fromBook(book);
      favorites.add(bookModel);
      final favoritesJson =
          json.encode(favorites.map((book) => book.toJson()).toList());
      await bookBox.put('favorites', favoritesJson);
    }
  }

  @override
  Future<void> removeFromFavorites(Book book) async {
    final favorites = await getFavorites();
    favorites.removeWhere((favBook) => favBook.id == book.id);
    final favoritesJson =
        json.encode(favorites.map((book) => book.toJson()).toList());
    await bookBox.put('favorites', favoritesJson);
  }

  @override
  Future<void> cacheBooks(List<BookModel> booksToCache, int page) async {
    final existingJsonString = bookBox.get(HiveBox.cachedBooksKey);
    List<BookModel> allBooks = [];

    if (existingJsonString != null) {
      final List<dynamic> existingJsonList = json.decode(existingJsonString);
      allBooks = existingJsonList
          .map<BookModel>((json) => BookModel.fromGoogleBooksJson(json))
          .toList();
    }

    // Replace or append new books based on the page
    final startIndex = (page - 1) * booksToCache.length;
    if (startIndex < allBooks.length) {
      // Replace existing books
      for (int i = 0; i < booksToCache.length; i++) {
        if (startIndex + i < allBooks.length) {
          allBooks[startIndex + i] = booksToCache[i];
        } else {
          allBooks.add(booksToCache[i]);
        }
      }
    } else {
      // Append new books
      allBooks.addAll(booksToCache);
    }

    final jsonString =
        json.encode(allBooks.map((book) => book.toJson()).toList());
    await bookBox.put(HiveBox.cachedBooksKey, jsonString);
  }
}
