import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/params/pagination_params.dart';
import '../../core/usecases/usecase.dart';
import '../entities/book.dart';
import '../repositories/book_repository.dart';

class GetBooks implements UseCase<List<Book>, PaginationParams> {
  final BookRepository repository;

  GetBooks(this.repository);

  @override
  Future<Either<Failure, List<Book>>> call(PaginationParams params) async {
    return await repository.getBooks(params.page, params.limit);
  }
}
