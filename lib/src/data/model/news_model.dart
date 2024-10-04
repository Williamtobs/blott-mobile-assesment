import 'dart:convert';

class NewsModel {
  NewsModel({
    required this.category,
    required this.datetime,
    required this.headline,
    required this.id,
    required this.image,
    required this.related,
    required this.source,
    required this.summary,
    required this.url,
  });

  final String? category;
  final num? datetime;
  final String? headline;
  final int? id;
  final String? image;
  final String? related;
  final String? source;
  final String? summary;
  final String? url;

  NewsModel copyWith({
    String? category,
    num? datetime,
    String? headline,
    int? id,
    String? image,
    String? related,
    String? source,
    String? summary,
    String? url,
  }) {
    return NewsModel(
      category: category ?? this.category,
      datetime: datetime ?? this.datetime,
      headline: headline ?? this.headline,
      id: id ?? this.id,
      image: image ?? this.image,
      related: related ?? this.related,
      source: source ?? this.source,
      summary: summary ?? this.summary,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (category != null) {
      result.addAll({'category': category});
    }
    if (datetime != null) {
      result.addAll({'datetime': datetime});
    }
    if (headline != null) {
      result.addAll({'headline': headline});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (image != null) {
      result.addAll({'image': image});
    }
    if (related != null) {
      result.addAll({'related': related});
    }
    if (source != null) {
      result.addAll({'source': source});
    }
    if (summary != null) {
      result.addAll({'summary': summary});
    }
    if (url != null) {
      result.addAll({'url': url});
    }

    return result;
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      category: map['category'],
      datetime: map['datetime'],
      headline: map['headline'],
      id: map['id'],
      image: map['image'],
      related: map['related'],
      source: map['source'],
      summary: map['summary'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source));
}
