import 'package:dev_template_flutter/common/app/app.dart';
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/db/db.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

class SearchController extends BaseGetController {

  final TextEditingController inputController = TextEditingController();

  List<Search>? recordList = [];

  String? input = '';

  void onBack() {
    Get.back();
  }


  bool isSearch = false;
  void setSearch(bool isSearch) {
    this.isSearch = isSearch;
    update(['search']);
  }

  bool isRecord = false;
  void setRecord(bool isRecord) {
    this.isRecord = isRecord;
    update(['record']);
  }


  @override
  void onReady() {
    final map = Get.arguments;
    if(map != null) {
      input = map['search'];
      if(!UIUtils.isEmpty(input)) {
        inputController.text = input!;
        setSearch(true);
      }
    }

    recordList =  Global.dbUtil?.getSearchList();
    if(recordList != null && recordList!.isNotEmpty) {
      setRecord(true);
    }
    super.onReady();
  }

  void onSearch(String? input) {
    if(!UIUtils.isEmpty(input)) {
      Global.dbUtil?.saveSearch(Search(content: input)).then((value) => LogUtils.GGQ('=====保存搜索内容=======>>>${value}'));
    }
  }

  void clearRecord() {
    Global.dbUtil?.clearSearch().then((value){
      if(value) {
        recordList?.clear();
        setRecord(false);
      }
    });
  }
}