import '../../domain/entities/book.dart';

class BookModel extends Book {
  BookModel({
    required super.id,
    required super.title,
    required super.authors,
    required super.coverImageUrl,
    required super.description,
    required super.firstPublishYear,
    required super.publisher,
    required super.pageCount,
    required super.categories,
    required super.averageRating,
    required super.ratingsCount,
  });

  factory BookModel.fromGoogleBooksJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] as Map<String, dynamic>? ?? {};
    return BookModel(
      id: json['id'] as String? ?? '',
      title: volumeInfo['title'] as String? ?? 'Unknown Title',
      authors: (volumeInfo['authors'] as List<dynamic>?)
              ?.map((author) => author as String)
              .toList() ??
          ['Unknown Author'],
      coverImageUrl: (volumeInfo['imageLinks']
              as Map<String, dynamic>?)?['thumbnail'] as String? ??
          '',
      description: volumeInfo['description'] as String? ?? '',
      firstPublishYear: volumeInfo['publishedDate'] ?? 'Not Available',
      publisher: volumeInfo['publisher'] as String? ?? '',
      pageCount: volumeInfo['pageCount'] as int? ?? 0,
      categories: (volumeInfo['categories'] as List<dynamic>?)
              ?.map((category) => category as String)
              .toList() ??
          [],
      averageRating: (volumeInfo['averageRating'] as num?)?.toDouble() ?? 0.0,
      ratingsCount: volumeInfo['ratingsCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'volumeInfo': {
        'title': title,
        'authors': authors,
        'description': description,
        'publishedDate': firstPublishYear,
        'publisher': publisher,
        'pageCount': pageCount,
        'categories': categories,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        'imageLinks': {
          'thumbnail': coverImageUrl,
        },
      },
    };
  }
}
