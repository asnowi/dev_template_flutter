
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';
import 'package:dev_template_flutter/pages/home/nav/main/main.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key,
    required this.controller
  }) : super(key: key);

  late MainController controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
        child: MaterialButton(
          onPressed: () => controller.onSearch(),
          splashColor: Colors.blueGrey.shade100,
          highlightColor: Colors.blueGrey.shade50,
          elevation: 0.0,
          child: IconText(
            alignment: MainAxisAlignment.start,
            icon: const Icon(Ionicons.search,size: 14,color: Colors.grey),
            text: Text('search',style: TextStyle(color: Colors.grey,fontSize: 16.sp,fontWeight: FontWeight.normal),
            ),
          ),
        )
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
    );
  }
}
