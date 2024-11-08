import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BookmarkScreen extends StatelessWidget {
  final List<String> bookmarkedImages;

  const BookmarkScreen({required this.bookmarkedImages});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmarked Images')),
      body: bookmarkedImages.isEmpty
          ? Center(child: Text('No Bookmarks'))
          : ListView.builder(
              itemCount: bookmarkedImages.length,
              itemBuilder: (context, index) {
                final imageUrl = bookmarkedImages[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
