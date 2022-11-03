import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

class SearchController extends BaseGetController {

  final TextEditingController searchController = TextEditingController();

  String? input = '';

  void onBack() {
    Get.back();
  }


  bool isSearch = false;
  void setSearch(bool isSearch) {
    this.isSearch = isSearch;
    update(['search']);
  }


  @override
  void onReady() {
    final map = Get.arguments;
    if(map != null) {
      input = map['search'];
      if(!UIUtils.isEmpty(input)) {
        searchController.text = input!;
        setSearch(true);
      }
    }
    super.onReady();
  }
}