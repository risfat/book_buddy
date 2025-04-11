class Book {
  final String id;
  final String title;
  final List<String> authors;
  final String coverImageUrl;
  final String description;
  final String? firstPublishYear;
  final String publisher;
  final int pageCount;
  final List<String> categories;
  final double averageRating;
  final int ratingsCount;
  final bool isFavorite;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.coverImageUrl,
    required this.description,
    required this.firstPublishYear,
    required this.publisher,
    required this.pageCount,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    this.isFavorite = false,
  });

  // Copy with method
  Book copyWith({
    String? id,
    String? title,
    List<String>? authors,
    String? coverImageUrl,
    String? description,
    String? firstPublishYear,
    String? publisher,
    int? pageCount,
    List<String>? categories,
    double? averageRating,
    int? ratingsCount,
    bool? isFavorite,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      authors: authors ?? this.authors,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      description: description ?? this.description,
      firstPublishYear: firstPublishYear ?? this.firstPublishYear,
      publisher: publisher ?? this.publisher,
      pageCount: pageCount ?? this.pageCount,
      categories: categories ?? this.categories,
      averageRating: averageRating ?? this.averageRating,
      ratingsCount: ratingsCount ?? this.ratingsCount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
