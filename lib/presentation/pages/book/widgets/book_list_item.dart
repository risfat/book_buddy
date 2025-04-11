import 'package:flutter/material.dart';

import '../../../../domain/entities/book.dart';

class BookListItem extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const BookListItem({
    super.key,
    required this.book,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCoverImage(),
              const SizedBox(width: 16),
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: Colors.black87,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            book.authors.join(', '),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.black54,
                                  fontStyle: FontStyle.italic,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              book.firstPublishYear?.toString() ??
                                  'Unknown date',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          _buildFavoriteButton(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoverImage() {
    return Hero(
      tag: 'book-cover-${book.id}',
      child: Container(
        width: 80,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            book.coverImageUrl,
            width: 80,
            height: 120,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 80,
                height: 120,
                color: Colors.grey[300],
                child: const Icon(Icons.book, color: Colors.grey, size: 40),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onFavoriteToggle,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            book.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: book.isFavorite ? Colors.red : Colors.grey,
            size: 24,
          ),
        ),
      ),
    );
  }
}
