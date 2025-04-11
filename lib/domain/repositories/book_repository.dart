import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/book.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getBooks(int page, int limit);
  Future<Either<Failure, List<Book>>> searchBooks(String query);
  Future<Either<Failure, List<Book>>> getFavorites();
  Future<Either<Failure, void>> addToFavorites(Book book);
  Future<Either<Failure, void>> removeFromFavorites(Book book);
}
