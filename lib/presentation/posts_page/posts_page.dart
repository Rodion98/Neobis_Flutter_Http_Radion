import 'package:neobis_flutter_http_rodion/presentation/posts_page/bloc/post_bloc.dart';
import 'package:neobis_flutter_http_rodion/presentation/posts_page/posts_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 81, 220, 255),
        title: const Text("Neobis flutter http"),
      ),
      body: BlocProvider(
        create: (_) => PostBloc()
          ..add(
            PostFetched(),
          ),
        child: const PostsList(),
      ),
    );
  }
}
