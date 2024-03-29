import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
final class Post extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  Post copyWith({
    required int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Post(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body);
  }

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  List<Object> get props => [userId, id, title, body];
}
