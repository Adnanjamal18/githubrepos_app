class Githubrepo {
    String? url;
    String? forksUrl;
    String? commitsUrl;
    String? id;
    String? nodeId;
    String? gitPullUrl;
    String? gitPushUrl;
    String? htmlUrl;
    Files? files;
    bool? public;
    String? createdAt;
    String? updatedAt;
    String? description;
    int? comments;
    String? commentsUrl;
    Owner? owner;
    bool? truncated;

    Githubrepo({this.url, this.forksUrl, this.commitsUrl, this.id, this.nodeId, this.gitPullUrl, this.gitPushUrl, this.htmlUrl, this.files, this.public, this.createdAt, this.updatedAt, this.description, this.comments, this.commentsUrl, this.owner, this.truncated});

    Githubrepo.fromJson(Map<String, dynamic> json) {
        url = json["url"];
        forksUrl = json["forks_url"];
        commitsUrl = json["commits_url"];
        id = json["id"];
        nodeId = json["node_id"];
        gitPullUrl = json["git_pull_url"];
        gitPushUrl = json["git_push_url"];
        htmlUrl = json["html_url"];
        files = json["files"] == null ? null : Files.fromJson(json["files"]);
        public = json["public"];
        createdAt = json["created_at"];
        updatedAt = json["updated_at"];
        description = json["description"];
        comments = json["comments"];
        commentsUrl = json["comments_url"];
        owner = json["owner"] == null ? null : Owner.fromJson(json["owner"]);
        truncated = json["truncated"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["url"] = url;
        _data["forks_url"] = forksUrl;
        _data["commits_url"] = commitsUrl;
        _data["id"] = id;
        _data["node_id"] = nodeId;
        _data["git_pull_url"] = gitPullUrl;
        _data["git_push_url"] = gitPushUrl;
        _data["html_url"] = htmlUrl;
        if(files != null) {
            _data["files"] = files?.toJson();
        }
        _data["public"] = public;
        _data["created_at"] = createdAt;
        _data["updated_at"] = updatedAt;
        _data["description"] = description;
        _data["comments"] = comments;
        _data["comments_url"] = commentsUrl;
        if(owner != null) {
            _data["owner"] = owner?.toJson();
        }
        _data["truncated"] = truncated;
        return _data;
    }
}

class Owner {
    String? login;
    int? id;
    String? nodeId;
    String? avatarUrl;
    String? gravatarId;
    String? url;
    String? htmlUrl;
    String? followersUrl;
    String? followingUrl;
    String? gistsUrl;
    String? starredUrl;
    String? subscriptionsUrl;
    String? organizationsUrl;
    String? reposUrl;
    String? eventsUrl;
    String? receivedEventsUrl;
    String? type;
    String? userViewType;
    bool? siteAdmin;

    Owner({this.login, this.id, this.nodeId, this.avatarUrl, this.gravatarId, this.url, this.htmlUrl, this.followersUrl, this.followingUrl, this.gistsUrl, this.starredUrl, this.subscriptionsUrl, this.organizationsUrl, this.reposUrl, this.eventsUrl, this.receivedEventsUrl, this.type, this.userViewType, this.siteAdmin});

    Owner.fromJson(Map<String, dynamic> json) {
        login = json["login"];
        id = json["id"];
        nodeId = json["node_id"];
        avatarUrl = json["avatar_url"];
        gravatarId = json["gravatar_id"];
        url = json["url"];
        htmlUrl = json["html_url"];
        followersUrl = json["followers_url"];
        followingUrl = json["following_url"];
        gistsUrl = json["gists_url"];
        starredUrl = json["starred_url"];
        subscriptionsUrl = json["subscriptions_url"];
        organizationsUrl = json["organizations_url"];
        reposUrl = json["repos_url"];
        eventsUrl = json["events_url"];
        receivedEventsUrl = json["received_events_url"];
        type = json["type"];
        userViewType = json["user_view_type"];
        siteAdmin = json["site_admin"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["login"] = login;
        _data["id"] = id;
        _data["node_id"] = nodeId;
        _data["avatar_url"] = avatarUrl;
        _data["gravatar_id"] = gravatarId;
        _data["url"] = url;
        _data["html_url"] = htmlUrl;
        _data["followers_url"] = followersUrl;
        _data["following_url"] = followingUrl;
        _data["gists_url"] = gistsUrl;
        _data["starred_url"] = starredUrl;
        _data["subscriptions_url"] = subscriptionsUrl;
        _data["organizations_url"] = organizationsUrl;
        _data["repos_url"] = reposUrl;
        _data["events_url"] = eventsUrl;
        _data["received_events_url"] = receivedEventsUrl;
        _data["type"] = type;
        _data["user_view_type"] = userViewType;
        _data["site_admin"] = siteAdmin;
        return _data;
    }
}


class Files {
  Map<String, Gistfile1Txt>? filesMap;

  Files({this.filesMap});

  Files.fromJson(Map<String, dynamic> json) {
    filesMap = json.map((key, value) => MapEntry(key, Gistfile1Txt.fromJson(value)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(filesMap != null) {
      filesMap!.forEach((key, value) {
        _data[key] = value.toJson();
      });
    }
    return _data;
  }
}


class Gistfile1Txt {
    String? filename;
    String? type;
    String? language;
    String? rawUrl;
    int? size;

    Gistfile1Txt({this.filename, this.type, this.language, this.rawUrl, this.size});

    Gistfile1Txt.fromJson(Map<String, dynamic> json) {
        filename = json["filename"];
        type = json["type"];
        language = json["language"];
        rawUrl = json["raw_url"];
        size = json["size"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["filename"] = filename;
        _data["type"] = type;
        _data["language"] = language;
        _data["raw_url"] = rawUrl;
        _data["size"] = size;
        return _data;
    }
}





