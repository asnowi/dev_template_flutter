import 'dart:math';

import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

import 'mine.dart';

class MineView extends BaseGetView<MineController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          _buildHeader(),
          _buildContent()
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.only(top: 60.h,bottom: 30.h),
      child: Text('header'),
    );
  }

  Widget _buildContent() {
    return Text('content');
  }
}
