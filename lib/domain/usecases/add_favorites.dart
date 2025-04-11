import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/book.dart';
import '../repositories/book_repository.dart';

class AddToFavorites implements UseCase<void, Book> {
  final BookRepository repository;

  AddToFavorites(this.repository);

  @override
  Future<Either<Failure, void>> call(Book params) async {
    return await repository.addToFavorites(params);
  }
}
