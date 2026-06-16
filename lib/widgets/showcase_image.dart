import 'package:flutter/material.dart';

class ShowcaseImage {
  const ShowcaseImage({required this.asset, required this.caption});

  final String asset;
  final String caption;
}

class ShowcaseImageCard extends StatelessWidget {
  const ShowcaseImageCard({
    super.key,
    required this.asset,
    required this.caption,
    this.aspectRatio = 16 / 10,
    this.compact = false,
  });

  final String asset;
  final String caption;
  final double aspectRatio;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(compact ? 14 : 18),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Image.asset(
              asset,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFF1E293B),
                alignment: Alignment.center,
                child: const Icon(Icons.image_not_supported_outlined, color: Color(0xFF94A3B8), size: 36),
              ),
            ),
          ),
        ),
        SizedBox(height: compact ? 6 : 10),
        Text(
          caption,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: compact ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
            fontSize: compact ? 11 : 13,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class ShowcaseImageGallery extends StatelessWidget {
  const ShowcaseImageGallery({
    super.key,
    required this.images,
    this.dark = false,
    this.compact = false,
  });

  final List<ShowcaseImage> images;
  final bool dark;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final columns = w > 900 ? 3 : (w > 520 ? 2 : 1);
        final itemWidth = columns == 1 ? w : (w - (columns - 1) * 16) / columns;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            for (final img in images)
              SizedBox(
                width: itemWidth,
                child: ShowcaseImageCard(
                  asset: img.asset,
                  caption: img.caption,
                  compact: compact,
                ),
              ),
          ],
        );
      },
    );
  }
}
