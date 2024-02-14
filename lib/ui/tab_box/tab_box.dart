import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_1/cubits/tab/tab_cubit.dart';
import 'package:task_1/ui/tab_box/comments/comments_screen.dart';
import 'package:task_1/ui/tab_box/home/home_screen.dart';
import 'package:task_1/ui/tab_box/photos/photos_screen.dart';
import 'package:task_1/ui/tab_box/users/users_screen.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  static List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const CommentsScreen(),
      const PhotosScreen(),
      const UsersScreen(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: context.watch<TabCubit>().state,
          children: screens,
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              fontFamily: "Urbanist",
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              height: 12 / 10,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: "Urbanist",
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.black12,
              height: 12 / 10,
            ),
            items: <BottomNavigationBarItem>[
              _getItem(icon: Icons.home, label: 'Posts'),
              _getItem(icon: Icons.comment, label: 'Comments'),
              _getItem(icon: Icons.photo, label: 'Photos'),
              _getItem(icon: Icons.person, label: 'users'),
            ],
            currentIndex: context.watch<TabCubit>().state,
            onTap: context.read<TabCubit>().changeTabIndex,
          ),
        ));
  }

  BottomNavigationBarItem _getItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      activeIcon: Icon(icon,color: Colors.black),
      icon: Icon(icon,color: Colors.grey),
      label: label,
    );
  }
}
