import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/blocs/comments/comments_bloc.dart';
import 'package:task_1/data/models/comments/comments_model.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {


  @override
  void initState() {
    context.read<CommentsBloc>().scrollController.addListener(() {
      if (context.read<CommentsBloc>().scrollController.position.pixels ==
          context.read<CommentsBloc>().scrollController.position.maxScrollExtent) {
        context.read<CommentsBloc>().add(FetchComments());
      }
    });
    context.read<CommentsBloc>().add(GetComments());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text("Comments screen"),
      ),
      body: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
          if(state is ErrorComments){
            return Center(child: Text(state.errorText),);
          }
          if(state is SuccessComments) {
            return ListView(
              controller: context.read<CommentsBloc>().scrollController,
              children: [
                ...List.generate(state.comments.length, (index) {
                  CommentsModel comments = state.comments[index];
                  return ListTile(
                    title: Text(comments.name),
                    subtitle: Text(comments.body),
                    trailing: Text(comments.id.toString()),
                  );
                }),
                Visibility(
                  visible: context.watch<CommentsBloc>().isLoading,
                    child: const Center(child: CircularProgressIndicator(),))
              ],
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
