import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/values/values.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';
import 'package:dev_template_flutter/pages/home/nav/mine/mine.dart';

class UnLoginWidget extends StatelessWidget {
  UnLoginWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  late MineController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      child: Column(
        children: [
          Container(
            height: 0.2.sh,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                top: 30.h, left: AppDimens.slideGap, right: AppDimens.slideGap),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.loose(const Size(64, 64)),
                    child:
                        Image.asset(AssetsProvider.imagePath('avatar_default')),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 8.w)),
                TextButton(
                    onPressed: () => controller.onLogin(),
                    style: AppStyles.getCommonButtonStyle(width: 100.w),
                    child: const Text('请登录'))
              ],
            ),
          ),
          MDivider(),
          Container(
            width: getWidth(),
            height: 0.75.sh,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  Container(
                constraints: constraints,
                child: Column(
                  children: [
                    const Flexible(child: SizedBox.shrink()),
                    Flexible(
                      child: TextButton(
                        onPressed: () => controller.onLogin(),
                        style: AppStyles.getCommonButtonStyle(
                            width: getWidth() * 0.75, height: 52.h),
                        child: const Text('请登录'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
