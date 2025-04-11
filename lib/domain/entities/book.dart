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
  });
}
