import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_1/data/models/posts/posts_model.dart';

class PostsHiveService {
  static Future<void> initHive() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(PostsModelAdapter());
  }

  static Future<Box<PostsModel>> openBox() async {
    return await Hive.openBox<PostsModel>('posts');
  }

  static Future<void> addPost(PostsModel post) async {
    final box = await openBox();
    await box.add(post);
  }

  static Future<void> updatePost(int key, PostsModel updatedPost) async {
    final box = await openBox();
    await box.put(key, updatedPost);
  }

  static Future<void> deletePost(int key) async {
    final box = await openBox();
    await box.delete(key);
  }

  static Future<PostsModel?> getPost(int key) async {
    final box = await openBox();
    return box.get(key);
  }

  static Future<void> putPosts(List<PostsModel> posts) async {
    final box = await openBox();
    await box.clear();
    await box.addAll(posts);
  }

  static Future<List<PostsModel>> getAllPosts() async {
    final box = await openBox();
    return box.values.toList();
  }
}