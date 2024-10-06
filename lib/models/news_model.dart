
import 'package:daily_topper/models/source_model.dart';

class NewsModel {
  final String? id;
  final String? author;
  final String? title;
  final String? url;
  final String? publishedAt;
  final String? content;
  final SourceModel? source;

  const NewsModel({
    this.id,
    this.author,
    this.title,
    this.url,
    this.publishedAt,
    this.content,
    this.source,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          author == other.author &&
          title == other.title &&
          url == other.url &&
          publishedAt == other.publishedAt &&
          content == other.content &&
          source == other.source);

  @override
  int get hashCode =>
      id.hashCode ^
      author.hashCode ^
      title.hashCode ^
      url.hashCode ^
      publishedAt.hashCode ^
      content.hashCode ^
      source.hashCode;

  @override
  String toString() {
    return 'NewsModel{ id: $id, author: $author, title: $title, url: $url, publishedAt: $publishedAt, content: $content, source: $source,}';
  }

  NewsModel copyWith({
    String? id,
    String? author,
    String? title,
    String? url,
    String? publishedAt,
    String? content,
    SourceModel? source,
  }) {
    return NewsModel(
      id: id ?? this.id,
      author: author ?? this.author,
      title: title ?? this.title,
      url: url ?? this.url,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'title': title,
      'url': url,
      'publishedAt': publishedAt,
      'content': content,
      'source': source,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'] as String,
      author: map['author'] as String,
      title: map['title'] as String,
      url: map['url'] as String,
      publishedAt: map['publishedAt'] as String,
      content: map['content'] as String,
      source: map['source'] as SourceModel,
    );
  }
}
