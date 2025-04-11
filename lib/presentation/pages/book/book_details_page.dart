import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../domain/entities/book.dart';
import '../../widgets/custom_elevated_button.dart';

class BookDetailsPage extends StatelessWidget {
  final Book book;

  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            foregroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'book-cover-${book.id}',
                child: Image.network(
                  book.coverImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.book,
                          size: 100, color: Colors.white54),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                  ).animate().fadeIn().slideX(),
                  const SizedBox(height: 8),
                  Text(
                    'by ${book.authors.join(", ")}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ).animate().fadeIn().slideX(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: book.averageRating ?? 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          // TODO: Implement rating functionality
                        },
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '(${book.ratingsCount ?? 0})',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ).animate().fadeIn(),
                  const SizedBox(height: 16),
                  if (book.description.isNotEmpty) ...[
                    _buildSectionTitle(context, 'Description'),
                    const SizedBox(height: 8),
                    Text(
                      book.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ).animate().fadeIn(),
                    const SizedBox(height: 16),
                  ],
                  _buildInfoRow('Publisher', book.publisher ?? 'Unknown'),
                  _buildInfoRow(
                      'Published Date', book.firstPublishYear ?? 'Unknown'),
                  _buildInfoRow(
                      'Page Count', book.pageCount.toString() ?? 'Unknown'),
                  _buildInfoRow('Categories', book.categories.join(', ')),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onTap: () {
                            // TODO: Implement add to reading list functionality
                          },
                          child: const Text(
                            'Add to Favorite',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomElevatedButton(
                          onTap: () {
                            // TODO: Implement preview functionality
                          },
                          child: Text(
                            'Preview',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
    ).animate().fadeIn().slideX();
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    ).animate().fadeIn();
  }
}
