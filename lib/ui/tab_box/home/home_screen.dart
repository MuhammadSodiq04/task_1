import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/blocs/posts/posts_bloc.dart';
import 'package:task_1/data/models/posts/posts_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<PostsBloc>().add(GetPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text("Home screen"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if(state is ErrorPosts){
            return Center(child: Text(state.errorText));
          }
          if(state is SuccessPosts) {
            return ListView(
              children: [
                ...List.generate(state.posts.length, (index) {
                  PostsModel post = state.posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                    trailing: Text(post.id.toString()),
                  );
                })
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
