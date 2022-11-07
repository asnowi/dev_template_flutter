import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/refresh/refresh.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';

import 'main.dart';
import 'widget/widget.dart';

class MainView extends BaseGetView<MainController> {

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
          body: _buildContent(context)
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return GetBuilder<MainController>(
      id: 'refresh',
      builder: (_) => Refresh(
        enablePullDown: controller.enablePullDown,
        enablePullUp: controller.enablePullUp,
        controller: controller.refreshController,
        onRefresh: () => controller.onRefresh(),
        onLoadMore: () => controller.onLoadMore(),
        loadState: controller.loadState,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: <Widget>[
            SearchWidget(controller: controller),
            BannerWidget(controller: controller,),
            GridWidget(controller: controller),
            SliverList(delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.only(top: 10.0,bottom: 2.0,left: 12.0,right: 12.0),
                  shadowColor: Colors.blueGrey,
                  color: Colors.white,
                  child: Container(
                    height: 82.h,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
                    child: Text(controller.itemList[index]),
                  ),
                );
            },childCount: controller.itemList.length))
          ],
        ),
        onRetry: ()=> controller.onRetry(),
      ),
    );
  }
}