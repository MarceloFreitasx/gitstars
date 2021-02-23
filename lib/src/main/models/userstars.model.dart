// To parse this JSON data, do
//
//     final userStarsModel = userStarsModelFromJson(jsonString);

import 'dart:convert';

class UserStarsModel {
  UserStarsModel({
    this.name,
    this.avatarUrl,
    this.login,
    this.bioHtml,
    this.url,
    this.email,
    this.location,
    this.starredRepositories,
  });

  String name;
  String avatarUrl;
  String login;
  String bioHtml;
  String url;
  String email;
  String location;
  StarredRepositories starredRepositories;

  factory UserStarsModel.fromRawJson(String str) => UserStarsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserStarsModel.fromJson(Map<String, dynamic> json) => UserStarsModel(
        name: json["name"] == null ? null : json["name"],
        avatarUrl: json["avatarUrl"] == null ? null : json["avatarUrl"],
        login: json["login"] == null ? null : json["login"],
        bioHtml: json["bioHTML"] == null ? null : json["bioHTML"],
        url: json["url"] == null ? null : json["url"],
        email: json["email"] == null ? null : json["email"],
        location: json["location"] == null ? null : json["location"],
        starredRepositories:
            json["starredRepositories"] == null ? null : StarredRepositories.fromJson(json["starredRepositories"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "avatarUrl": avatarUrl == null ? null : avatarUrl,
        "login": login == null ? null : login,
        "bioHTML": bioHtml == null ? null : bioHtml,
        "url": url == null ? null : url,
        "email": email == null ? null : email,
        "location": location == null ? null : location,
        "starredRepositories": starredRepositories == null ? null : starredRepositories.toJson(),
      };
}

class StarredRepositories {
  StarredRepositories({
    this.totalCount,
    this.nodes,
  });

  int totalCount;
  List<Node> nodes;

  factory StarredRepositories.fromRawJson(String str) => StarredRepositories.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StarredRepositories.fromJson(Map<String, dynamic> json) => StarredRepositories(
        totalCount: json["totalCount"] == null ? null : json["totalCount"],
        nodes: json["nodes"] == null ? null : List<Node>.from(json["nodes"].map((x) => Node.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount == null ? null : totalCount,
        "nodes": nodes == null ? null : List<dynamic>.from(nodes.map((x) => x.toJson())),
      };
}

class Node {
  Node({
    this.name,
    this.stargazerCount,
    this.url,
    this.updatedAt,
    this.forkCount,
    this.description,
  });

  String name;
  int stargazerCount;
  String url;
  DateTime updatedAt;
  int forkCount;
  String description;

  factory Node.fromRawJson(String str) => Node.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        name: json["name"] == null ? null : json["name"],
        stargazerCount: json["stargazerCount"] == null ? null : json["stargazerCount"],
        url: json["url"] == null ? null : json["url"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        forkCount: json["forkCount"] == null ? null : json["forkCount"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "stargazerCount": stargazerCount == null ? null : stargazerCount,
        "url": url == null ? null : url,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "forkCount": forkCount == null ? null : forkCount,
        "description": description == null ? null : description,
      };
}
