import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/book.dart';

abstract class BookRepository {
  Future<Either<Failure, List<Book>>> getBooks(int page, int limit);
}
