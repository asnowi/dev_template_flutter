import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/pages/home/nav/main/main.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({Key? key,
    required this.controller
  }) : super(key: key);

  late MainController controller;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        elevation: 4.0,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)),),
        child: Container(
          height: 160.h,
          color: Colors.redAccent,
          child: Swiper(
            itemBuilder: (BuildContext context,int index){
              return Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
            },
            itemCount: 3,
            pagination: SwiperPagination(),
            control: SwiperControl(),
          ),
        ),
      )
    );
  }
}
