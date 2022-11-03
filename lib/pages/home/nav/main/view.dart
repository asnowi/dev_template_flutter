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

  Widget _buildItem(BuildContext context,int index){
    return Card(
        elevation: 2.0,
        margin: const EdgeInsets.only(top: 10.0,bottom: 2.0,left: 12.0,right: 12.0),
        shadowColor: Colors.blueGrey,
        color: Colors.white,
        child: Text(controller.itemList[index],style: TextStyle(fontSize: 14.sp,color: Colors.black87,fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildContent2(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: const Color(0xFF216FF6),
          title: Container(
            alignment: Alignment.centerLeft,
            width: 0.78.sw,
            height: 42.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: Colors.white, width: 1.0),
              color: Colors.white
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconText(
              alignment: MainAxisAlignment.start,
              icon: const Icon(Ionicons.search,size: 14,color: Colors.grey),
              text: Text('search',style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.normal),
              ),
            ),
          ),
          stretch: true,
          collapsedHeight: 62.h,
          expandedHeight: 74.h,
          floating: true,
          snap: false,
          pinned: true,
          primary: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              AssetsProvider.imagePath('header_bg'),
              fit: BoxFit.none,
            ),
            collapseMode: CollapseMode.parallax,
            titlePadding: const EdgeInsets.all(0),
            centerTitle: true,
          ),
        ),
        // Refresh(loadState: controller.loadState, controller: controller.refreshController, child: )
      ],
    );
  }

}