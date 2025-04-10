import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../domain/entities/book.dart';
import '../../../domain/repositories/book_repository.dart';
import '../local/books_local_data_source.dart';
import '../remote/books_remote_data_source.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;
  final BookLocalDataSource localDataSource;

  BookRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<Book>>> getBooks(int page, int limit) async {
    try {
      final remoteBooks = await remoteDataSource.getBooks(page, limit);
      await localDataSource.cacheBooks(remoteBooks, page);
      return Right(remoteBooks);
    } on ServerException {
      try {
        final localBooks = await localDataSource.getBooks(page, limit);
        return Right(localBooks);
      } on CacheException catch (e) {
        return Left(CacheFailure(
          e.message,
        ));
      } catch (e) {
        return Left(
          ServerFailure("Failed to retrieve books from server."),
        );
        // return const Left(CacheFailure(
        //   'An unexpected error occurred while retrieving cached books',
        // ));
      }
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['message'].toString() ??
              'Error occurred Please try again',
        ),
      );
    }
  }
}
