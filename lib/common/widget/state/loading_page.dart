import 'package:dev_template_flutter/common/utils/utils.dart';

import 'state.dart';

class LoadingPage extends StatelessWidget {

  LoadingPage({Key? key}) : super(key: key);


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
                _buildBlock(width: 96.0,height: 88.0),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildItem(width: 0.60.sw,height: 26.h,radius: 2.0),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                    _buildItem(width: 0.40.sw,height: 26.h,radius: 2.0),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                    _buildItem(width: 0.20.sw,height: 26.h,radius: 2.0),
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
            _buildItem(width: 0.20.sw),
          ],
        ),
      ),
    );
  }

  Widget _buildBlock({double? width,double? height,double? radius}) {
    return ShimmerWidget(width: width,height: height,radius: radius);
  }

  Widget _buildItem({double? width,double? height,double? radius}) {
    return ShimmerWidget(width: width,height: height,radius: radius);
  }
}


