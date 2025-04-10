import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/config/boxs.dart';
import '../../../core/error/exceptions.dart';
import '../../../domain/entities/book.dart';
import '../../models/book_model.dart';

abstract class BookLocalDataSource {
  Future<List<Book>> getBooks(int page, int limit);
  Future<void> cacheBooks(List<BookModel> books, int page);
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
            .map<BookModel>((json) => BookModel.fromJson(json))
            .toList();

        // Apply pagination
        final startIndex = (page - 1) * limit;
        final endIndex = startIndex + limit;
        return allBooks.sublist(
          startIndex,
          endIndex > allBooks.length ? allBooks.length : endIndex,
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
  Future<void> cacheBooks(List<BookModel> booksToCache, int page) async {
    final existingJsonString = bookBox.get(HiveBox.cachedBooksKey);
    List<BookModel> allBooks = [];

    if (existingJsonString != null) {
      final List<dynamic> existingJsonList = json.decode(existingJsonString);
      allBooks = existingJsonList
          .map<BookModel>((json) => BookModel.fromJson(json))
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
