import 'package:dev_template_flutter/common/db/search.dart';
import 'package:hive/hive.dart';

import 'db.dart';

class SearchAdapter extends TypeAdapter<Search>{
  @override
  Search read(BinaryReader reader) {
    return Search(
      content: reader.read(),
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Search obj) {
    writer.write(obj.content);
  }

  SearchAdapter();
}