import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/pages/home/nav/main/main.dart';
import 'package:card_swiper/card_swiper.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({Key? key,
    required this.controller,
  }) : super(key: key);

  late MainController controller;


  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 180.h,
        child: Swiper(
            itemBuilder: (context, index) {
              return Card(
                elevation: 4.0,
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(4.0),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)),),
                child: ImageLoader.load(url: controller.bannerList[index]),
              );
            },
            autoplay: true,
            itemCount: controller.bannerList.length,
            scrollDirection: Axis.horizontal,
            // 默认圆点
            pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(10.0),
              builder: DotSwiperPaginationBuilder(
                color: Colors.white54,
                activeColor: Colors.white,
                size: 6.0,
                activeSize: 6.0,
                space: 4.0
              )
            ),
            onTap: (index) => controller.onBanner(index),
            control: SwiperControl(
                color: Colors.white54,
                disableColor: Colors.grey.shade400,
                size: 22.0,
                padding: const EdgeInsets.all(12.0)
            )
        ),
      ),
    );
  }
}




// =======================flutter_swiper_plus=====================

// 自定义
//       // pagination: SwiperPagination(
//       //   margin: const EdgeInsets.all(8.0),
//       //   alignment: Alignment.bottomCenter,
//       //   builder: SwiperCustomPagination(
//       //     builder: (context,config) => PageIndicator(
//       //       count: config.itemCount,
//       //       config: config,
//       //     )
//       //   )
//       // ),
//       // 默认圆点
//       pagination: const SwiperPagination(
//         alignment: Alignment.bottomCenter,
//         margin: EdgeInsets.all(8.0),
//         builder: DotSwiperPaginationBuilder(
//           color: Colors.white38,
//           activeColor: Colors.white,
//           size: 6.0,
//           activeSize: 6.0,
//           space: 4.0
//         )
//       ),
//
class PageIndicator extends StatefulWidget {
  final SwiperPluginConfig? config;
  final int? count;
  const PageIndicator({Key? key,this.config,this.count}) : super(key: key);

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  int index = 0;
  @override
  void initState() {
    widget.config?.pageController?.addListener(_onController);
    super.initState();
  }


  @override
  void didUpdateWidget(covariant PageIndicator oldWidget) {
    if(widget.config?.pageController != oldWidget.config?.pageController){
      oldWidget.config?.pageController?.removeListener(_onController);
      widget.config?.pageController?.addListener(_onController);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.config?.pageController?.removeListener(_onController);
    super.dispose();
  }


  void _onController() {
    double page = widget.config?.pageController?.page ?? 0.0;
    index = page.floor();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        // color: Colors.black38,
        borderRadius: BorderRadius.circular(12.0),
        // gradient: const LinearGradient(      //渐变位置
        //     begin: Alignment.topCenter, //右上
        //     end: Alignment.bottomCenter, //左下
        //     stops: [0.1, 1.1],         //[渐变起始点, 渐变结束点]
        //     //渐变颜色[始点颜色, 结束颜色]
        //     colors: [Colors.transparent, Colors.black26]
        // ),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:_rowWidgets()
      ),
    );
  }

  List<Widget> _rowWidgets(){
    List <Widget> list = [];
    if(widget.count != null) {
      for (int x = 0 ; x < widget.count!; x ++){
        list.add(x == index ? _linePointWidget() : _pointWidget());
          list.add(const SizedBox(width: 5.0),
        );
      }
    }
    return list;
  }

  Widget _linePointWidget(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.0),
      ),
      width: 7.0,
      height: 4.0,
    );
  }

  Widget _pointWidget(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2)
      ),
      width: 4.0,
      height: 4.0,
    );
  }
}

