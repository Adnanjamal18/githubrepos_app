import 'package:flutter/material.dart';
import 'package:github_reposapp/modals/githubmodal.dart';

class RepoDetailsScreen extends StatelessWidget {
  final Githubrepo repo;
  RepoDetailsScreen({required this.repo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Repo Details')),
      body: repo.files == null || repo.files!.filesMap == null
    ? Center(child: Text('No details available'))
    : ListView(
        children: repo.files!.filesMap!.entries.map((entry) {
          final file = entry.value;
          return ListTile(
            title: Text(file.filename ?? "No Filename"),
            subtitle: Text('Size: ${file.size ?? 0} bytes'),
          );
        }).toList(),
      ),
    );
  }
}

