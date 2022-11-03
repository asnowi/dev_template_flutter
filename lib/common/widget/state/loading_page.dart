
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPage extends StatelessWidget {

  LoadingPage({Key? key}) : super(key: key);

  final Color baseColor = Colors.grey.shade100;
  final Color highlightColor = Colors.grey.shade200;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Container(
        constraints: BoxConstraints.tight(screenSize()),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 60.0,horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildBlock(),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildItem(width: 0.42.sw,height: 22.h,radius: 2.0),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    _buildItem(width: 0.58.sw,height: 22.h,radius: 2.0),
                  ],
                )
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            _buildItem(width: 0.48.sw),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            _buildItem(width: 0.68.sw),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            _buildItem(width: 0.88.sw),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            _buildItem(width: 0.28.sw),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            _buildItem(width: 0.68.sw),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            _buildItem(width: 0.48.sw),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            _buildItem(),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            _buildItem(width: 0.68.sw),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          ],
        ),
      ),
    );
  }

  Widget _buildBlock({double? width,double? height,double? radius}) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width?? 50.0,
        height: height?? 50.0,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(radius?? 4.0)
        ),
      ),
    );
  }

  Widget _buildItem({double? width,double? height,double? radius}) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width?? 0.82.sw,
        height: height?? 36.h,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(radius?? 4.0)
        ),
      ),
    );
  }
}
