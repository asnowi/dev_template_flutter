import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/pages/home/nav/main/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GridWidget extends StatelessWidget {
  GridWidget({Key? key,
    required this.controller
  }) : super(key: key);

  late MainController controller;

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
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //设置列数
      crossAxisCount: 3,
      //设置横向间距
      crossAxisSpacing: 4,
      //设置主轴间距
      mainAxisSpacing: 4,
      //宽高比
      childAspectRatio: 12/6
    ), itemBuilder: (context,index){
      return Container(
        alignment: Alignment.center,
        child: Column(
          children: const [
            FlutterLogo(),
            Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Text('aaa')
          ],
        ),
      );
    },itemCount: 6,);
  }

  Widget _buildIndicator(int page) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 8.h),
      child: SmoothPageIndicator(
        controller: controller.gridPageController,
        count: 2,
        effect: const WormEffect(
            dotHeight: 6,
            dotWidth: 6,
            type: WormType.thin,
            strokeWidth: 17,
            dotColor: Colors.black26,
            activeDotColor: Colors.blueAccent
        ),
      ),
    );
  }
}
