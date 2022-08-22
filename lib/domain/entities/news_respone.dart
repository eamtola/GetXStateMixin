import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:getmixin_using_api/domain/entities/article.dart';

class NewsRespone extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;
  const NewsRespone({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  const NewsRespone.empty({
    this.articles = const [],
    this.totalResults = 0,
    this.status = '',
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'status': status});
    result.addAll({'totalResults': totalResults});
    result.addAll({'articles': articles.map((x) => x.toMap()).toList()});

    return result;
  }

  factory NewsRespone.fromMap(Map<String, dynamic> map) {
    return NewsRespone(
      status: map['status'] ?? '',
      totalResults: map['totalResults']?.toInt() ?? 0,
      articles:
          List<Article>.from(map['articles']?.map((x) => Article.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsRespone.fromJson(String source) =>
      NewsRespone.fromMap(json.decode(source));

  @override
  List<Object> get props => [status, totalResults, articles];
}
