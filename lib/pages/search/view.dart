import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/refresh/refresh.dart';

import 'search.dart';

class SearchView extends BaseGetView<SearchController> {
  
  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Refresh(loadState: controller.loadState, controller: controller.refreshController, child: Text(''));
  }
}