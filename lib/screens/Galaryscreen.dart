import 'package:flutter/material.dart';
import 'package:github_reposapp/screens/bookmarkscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

class GalleryScreen extends StatefulWidget {
  final Function(List<String>) onBookmarkUpdate;
  final List<String> bookmarkedImages;

  GalleryScreen({required this.onBookmarkUpdate, required this.bookmarkedImages});
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<String> imageUrls = [];
  List<String> bookmarkedImages = [];

  @override
  void initState() {
    super.initState();
    fetchUnsplashImages();
  }

  Future<void> fetchUnsplashImages() async {
    final response = await http.get(
      Uri.parse('https://api.unsplash.com/photos/?client_id=YOUR_ACCESS_KEY'),
    );
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      setState(() {
        imageUrls = data.map((item) => item['urls']['regular'] as String).toList();
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  void toggleBookmark(String imageUrl) {
    setState(() {
      if (bookmarkedImages.contains(imageUrl)) {
        bookmarkedImages.remove(imageUrl);
      } else {
        bookmarkedImages.add(imageUrl);
      }
    });
  }

  void openFullScreenImage(String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FullScreenImage(
          imageUrl: imageUrl,
          isBookmarked: bookmarkedImages.contains(imageUrl),
          onBookmarkToggle: () => toggleBookmark(imageUrl),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookmarkScreen(bookmarkedImages: bookmarkedImages),
                ),
              );
            },
          ),
        ],
      ),
      body: imageUrls.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                final imageUrl = imageUrls[index];
                return GestureDetector(
                  onTap: () => openFullScreenImage(imageUrl),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
    );
  }
}



class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  const FullScreenImage({
    required this.imageUrl,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.white,
            ),
            onPressed: onBookmarkToggle,
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
