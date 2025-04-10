import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api.dart';
import '../../../core/network/dio_client.dart';
import '../../models/book_model.dart';

abstract class BookRemoteDataSource {
  Future<List<BookModel>> getBooks(int page, int limit);
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final Dio dio;

  BookRemoteDataSourceImpl({Dio? dio}) : dio = dio ?? DioClient.instance;

  @override
  Future<List<BookModel>> getBooks(int page, int limit) async {
    try {
      final response = await dio.get(
        API.BOOKS,
        queryParameters: {
          'skip': (page - 1) * limit,
          'limit': limit,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> bookList = responseData['books'];
        return bookList.map((json) => BookModel.fromJson(json)).toList();
      } else {
        throw ServerException(
            "Failed to fetch books: ${response.statusCode} - ${response.data}");
      }
    } on DioException catch (e) {
      throw ServerException(e.toString());
    }
  }
}
