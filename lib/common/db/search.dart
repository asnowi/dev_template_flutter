import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Search extends HiveObject{
  String? content = '';

  Search({
    this.content,
  });

  @override
  String toString() {
    return 'Search{content: $content}';
  }
}