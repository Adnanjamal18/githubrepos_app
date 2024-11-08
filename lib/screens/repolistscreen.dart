import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_reposapp/modals/githubmodal.dart';
import 'package:github_reposapp/screens/reportdetailscreen.dart';
import 'package:http/http.dart' as http;
class RepoListScreen extends StatefulWidget {
  @override
  _RepoListScreenState createState() => _RepoListScreenState();
}

class _RepoListScreenState extends State<RepoListScreen> {
  List<Githubrepo> _repos = [];

  @override
  void initState() {
    super.initState();
    fetchRepos();
  }

  Future<void> fetchRepos() async {
    final response = await http.get(Uri.parse('https://api.github.com/gists/public'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        _repos = data.map((item) => Githubrepo.fromJson(item)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _repos.length,
      itemBuilder: (context, index) {
        Githubrepo repo = _repos[index];
        return ListTile(
          title: Text(repo.description ?? 'No description'),
          subtitle: Text('Created: ${repo.createdAt}, Updated: ${repo.updatedAt}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RepoDetailsScreen(repo: repo),
              ),
            );
          },
          onLongPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Owner Information'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Owner: ${repo.owner?.login ?? 'Unknown'}'),
                      if (repo.owner?.avatarUrl != null)
                        Image.network(repo.owner!.avatarUrl!),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
