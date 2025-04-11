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
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBookTitle(context),
                  _buildAuthorName(context),
                  const SizedBox(height: 16),
                  _buildRatingSection(context),
                  const SizedBox(height: 24),
                  if (book.description.isNotEmpty) ...[
                    _buildSectionTitle(context, 'Description'),
                    const SizedBox(height: 8),
                    _buildDescription(context),
                    const SizedBox(height: 24),
                  ],
                  _buildInfoSection(context),
                  const SizedBox(height: 24),
                  _buildActionButtons(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
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
                child: const Icon(Icons.book, size: 100, color: Colors.white54),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBookTitle(BuildContext context) {
    return Text(
      book.title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
    ).animate().fadeIn().slideX();
  }

  Widget _buildAuthorName(BuildContext context) {
    return Text(
      'by ${book.authors.join(", ")}',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
    ).animate().fadeIn().slideX();
  }

  Widget _buildRatingSection(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: book.averageRating ?? 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 24,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            // TODO: Implement rating functionality
          },
        ),
        const SizedBox(width: 12),
        Text(
          '${book.averageRating?.toStringAsFixed(1) ?? 'N/A'} (${book.ratingsCount ?? 0})',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
        ),
      ],
    ).animate().fadeIn();
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      book.description,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.5,
            color: Colors.grey[800],
          ),
    ).animate().fadeIn();
  }

  Widget _buildInfoSection(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoRow('Publisher', book.publisher ?? 'Unknown'),
            _buildInfoRow('Published Date',
                book.firstPublishYear?.toString() ?? 'Unknown'),
            _buildInfoRow(
                'Page Count', book.pageCount?.toString() ?? 'Unknown'),
            _buildInfoRow('Categories', book.categories.join(', ')),
          ],
        ),
      ),
    ).animate().fadeIn().scale();
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            onTap: () {
              // TODO: Implement add to favorite functionality
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
            child: const Text(
              'Preview',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ).animate().fadeIn().slideY();
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
