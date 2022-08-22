import 'dart:convert';

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'author': author});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'url': url});
    result.addAll({'urlToImage': urlToImage});
    result.addAll({'publishedAt': publishedAt});
    result.addAll({'content': content});

    return result;
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source));
}
