import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:neobis_flutter_http_rodion/models/post.dart';

import 'package:dio/dio.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(const PostState()) {
    on<PostFetched>(_onPostFetched);
  }

  final dio = Dio();

  Future<void> _onPostFetched(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    try {
      if (state.status == PostStatus.initial) {
        final posts = await _fetchPosts();
        return emit(
          state.copyWith(
            status: PostStatus.success,
            posts: posts,
          ),
        );
      }
    } catch (_) {
      emit(
        state.copyWith(
          status: PostStatus.failure,
        ),
      );
    }
  }

  Future<List<Post>> _fetchPosts() async {
    final Response response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;
      List<Post> posts = responseData
          .map(
            (data) => Post.fromJson(data),
          )
          .toList();
      return posts;
    }
    throw Exception('error fetching posts');
  }
}
