import 'package:flutter/material.dart';
import 'package:github_reposapp/screens/Galaryscreen.dart';
import 'package:github_reposapp/screens/repolistscreen.dart';
import 'package:github_reposapp/screens/bookmarkscreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<String> bookmarkedImages = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateBookmarks(List<String> newBookmarks) {
    setState(() {
      bookmarkedImages = newBookmarks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Repos & Image Gallery'),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookmarkScreen(bookmarkedImages: bookmarkedImages),
                ),
              );
            },
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? RepoListScreen()
          : GalleryScreen(
              onBookmarkUpdate: _updateBookmarks,
              bookmarkedImages: bookmarkedImages,
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Repos'),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Gallery'),
        ],
      ),
    );
  }
}
