import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/blocs/comments/comments_bloc.dart';
import 'package:task_1/blocs/photos/photos_bloc.dart';
import 'package:task_1/blocs/posts/posts_bloc.dart';
import 'package:task_1/blocs/users/users_bloc.dart';
import 'package:task_1/cubits/auth_cubit/auth_cubit.dart';
import 'package:task_1/cubits/tab/tab_cubit.dart';
import 'package:task_1/data/local/hive_servise.dart';
import 'package:task_1/data/local/posts/posts_hive_servise.dart';
import 'package:task_1/data/network/api_provider.dart';
import 'package:task_1/data/network/api_repository.dart';
// import 'package:task_1/ui/auth/auth_screen.dart';
import 'package:task_1/ui/tab_box/tab_box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await PostsHiveService.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CurrencyRepository(apiProvider: ApiProvider()),
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => PostsBloc(apiRepository: context.read<CurrencyRepository>())),
        BlocProvider(create: (context) => CommentsBloc(apiRepository: context.read<CurrencyRepository>())),
        BlocProvider(create: (context) => PhotosBloc(apiRepository: context.read<CurrencyRepository>())),
        BlocProvider(create: (context) => UsersBloc(apiRepository: context.read<CurrencyRepository>())),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => TabCubit()),
      ], child: const MainApp()),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: TabBox());
  }
}
