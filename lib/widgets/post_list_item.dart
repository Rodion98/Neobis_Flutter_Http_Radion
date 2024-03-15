import 'package:flutter/material.dart';
import 'package:neobis_flutter_http_rodion/models/post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            child: ListTile(
              leading: Column(
                children: [
                  Text(
                    'id : ${post.id}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    'userId : ${post.userId}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
              title: Text(
                post.title,
                style: const TextStyle(fontSize: 16),
              ),
              isThreeLine: true,
              subtitle: Text(post.body),
              tileColor: const Color.fromARGB(255, 170, 221, 245),
              dense: true,
            ),
          ),
        ],
      ),
    );
  }
}
