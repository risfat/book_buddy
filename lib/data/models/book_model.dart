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
    required super.isFavorite,
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
      isFavorite: false, // Assume default value for now
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
        'isFavorite': isFavorite,
      },
    };
  }

  // Converter method: Book to BookModel
  factory BookModel.fromBook(Book book) {
    return BookModel(
      id: book.id,
      title: book.title,
      authors: book.authors,
      coverImageUrl: book.coverImageUrl,
      description: book.description,
      firstPublishYear: book.firstPublishYear,
      publisher: book.publisher,
      pageCount: book.pageCount,
      categories: book.categories,
      averageRating: book.averageRating,
      ratingsCount: book.ratingsCount,
      isFavorite: book.isFavorite,
    );
  }

  // Converter method: BookModel to Book
  Book toBook() {
    return Book(
      id: id,
      title: title,
      authors: authors,
      coverImageUrl: coverImageUrl,
      description: description,
      firstPublishYear: firstPublishYear,
      publisher: publisher,
      pageCount: pageCount,
      categories: categories,
      averageRating: averageRating,
      ratingsCount: ratingsCount,
      isFavorite: isFavorite,
    );
  }
}
