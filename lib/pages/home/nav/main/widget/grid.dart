import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';
import 'package:dev_template_flutter/pages/home/nav/main/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GridWidget extends StatelessWidget {
  GridWidget({Key? key,
    required this.controller,
  }) : super(key: key);

  MainController controller;

  List<Widget> _list(context) {
    return [
      _buildPageItem(1),
      _buildPageItem(2),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        height: 196.h,
        child: PageView(
          scrollDirection: Axis.horizontal,
          reverse: false,
          controller: controller.gridPageController,
          physics: const BouncingScrollPhysics(),
          pageSnapping: true,
          onPageChanged: (index) {
            //监听事件
            LogUtils.GGQ('index=====$index');
          },
          children: _list(context),
        ),
      ),
    );
  }

  Widget _buildPageItem(int page) {
    return Stack(
      children: [
        _buildGridView(page),
        _buildIndicator(page)
      ],
    );
  }
  Widget _buildGridView(int page) {
    return Container(
      color: Colors.grey.shade200,
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        //水平子Widget之间间距
        crossAxisSpacing: 2.0,
        //垂直子Widget之间间距
        mainAxisSpacing: 4.0,
        //GridView内边距
        padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 2.0),
        //一行的Widget数量
        crossAxisCount: 3,
        //子Widget宽高比例
        childAspectRatio: 1.5,
        //子Widget列表
        children: getPageList(page).map((item) => _buildItemContainer(item)).toList(),
      ),
    );
  }

  Widget _buildIndicator(int page) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 8.h),
      child: SmoothPageIndicator(
        controller: controller.gridPageController,
        count: 2,
        effect: const SlideEffect(
            radius:  1.0,
            dotWidth:  10.0,
            dotHeight:  3.0,
            paintStyle:  PaintingStyle.fill,
            dotColor: Colors.white38,
            activeDotColor: Colors.white70
        ),
      ),
    );
  }

  List<GridItem> getPageList(int page) {
    return page == 1? controller.gridList1: controller.gridList2;
  }

  Widget _buildItemContainer(GridItem item) {
    return MaterialButton(
      splashColor: Colors.white12,
      highlightColor: Colors.white10,
      onPressed: () => controller.onGridItem(item),child: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                constraints: const BoxConstraints.expand(),
                child: ImageLoader.load(url: item.url??'',fit: BoxFit.cover),
              )),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(item.title??'')
        ],
      ),
    ),);
  }
}

class GridItem{
  GridItem({Key? key,this.title,this.url});

  String? title;
  String? url;

}

