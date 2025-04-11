import 'package:book_buddy/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/book.dart';

class GetFavorites implements UseCase<List<Book>, NoParams> {
  final BookRepository repository;

  GetFavorites(this.repository);

  @override
  Future<Either<Failure, List<Book>>> call(NoParams params) async {
    return await repository.getFavorites();
  }
}
