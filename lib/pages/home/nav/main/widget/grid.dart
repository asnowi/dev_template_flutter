import 'package:dev_template_flutter/common/utils/utils.dart';
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
        height: 180.h,
        color: Colors.greenAccent,
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
    List<String> list = getPageListLength(page);
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //设置列数
          crossAxisCount: 3,
          //设置横向间距
          crossAxisSpacing: 4,
          //设置主轴间距
          mainAxisSpacing: 4,
          //宽高比
          childAspectRatio: 12/ list.length
      ), itemBuilder: (context,index){
      return Container(
        alignment: Alignment.center,
        child: MaterialButton(
          onPressed: () => controller.onGridItem(page,index),
          splashColor: Colors.white12,
          highlightColor: Colors.white10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const FlutterLogo(),
              const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
              Text(list[index])
            ],
          ),
        ),
      );
    },itemCount: list.length);
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

  List<String> getPageListLength(int page) {
    return page == 1? controller.gridList1: controller.gridList2;
  }
}

