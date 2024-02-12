import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/blocs/posts/posts_bloc.dart';
import 'package:task_1/cubits/auth_cubit/auth_cubit.dart';
import 'package:task_1/data/local/hive_servise.dart';
import 'package:task_1/data/network/api_provider.dart';
import 'package:task_1/data/network/api_repository.dart';
import 'package:task_1/ui/auth/auth_screen.dart';
import 'package:task_1/ui/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CurrencyRepository(apiProvider: ApiProvider()),
      child: MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                PostsBloc(apiRepository: context.read<CurrencyRepository>())),
        BlocProvider(create: (context) => AuthCubit()),
      ], child: const MainApp()),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: HiveService.get("isAuth")==true?const AuthScreen():const HomeScreen());
  }
}
