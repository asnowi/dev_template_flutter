import 'package:dev_template_flutter/common/app/app.dart';
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';

import 'userInfo.dart';

class UserInfoView extends BaseGetView<UserInfoController> {
  UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('个人信息'),
            leading: UIUtils.onAppBarBack(onBack: () => controller.onBack())),
        body: _buildContent(context));
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Container(
        constraints: BoxConstraints.tight(screenSize()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildAvatar(context),
            MDivider(indent: 15.w),
            _buildNickname(),
            MDivider(indent: 15.w),
            _buildNickname(),
            MDivider(indent: 15.w),
            _buildNickname(),
            MDivider(indent: 15.w),
            _buildNickname(),
            MDivider(indent: 15.w),
            _buildNickname(),
            MDivider(indent: 15.w),
            _buildNickname(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return MaterialButton(
      onPressed: () => controller.onImagePicker(context),
      splashColor: Colors.blueGrey.shade100,
      highlightColor: Colors.blueGrey.shade50,
      elevation: 4.0,
      child: Padding(padding: EdgeInsets.symmetric(vertical: 10.h),child: Row(
        children: [Text('头像', style: TextStyle(color: Colors.black87, fontSize: 16.sp),),
          Expanded(child: Container()),
          Container(
            constraints: BoxConstraints.tight(const Size(64, 64)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.grey, width: .5),
            ),
            alignment: Alignment.center,
            child: ImageLoader.load(url: Global.user?.avatarImg ?? ''),
          ),
          const Padding(padding: EdgeInsets.only(left: 6.0)),
          const Icon(
            Ionicons.chevron_forward,
            size: 18.0,
            color: Colors.black26,
          )
        ],
      ),),
    );
  }

  Widget _buildNickname() {
    return MaterialButton(onPressed: () => ToastUtils.show('姓名'),
        splashColor: Colors.blueGrey.shade100,
        highlightColor: Colors.blueGrey.shade50,
        elevation: 4.0,
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        children: [Text('名称', style: TextStyle(color: Colors.black87, fontSize: 16.sp),),
          Expanded(child: Container()),
          Text(
            Global.user?.nickname ?? '',
            style: TextStyle(color: Colors.black45, fontSize: 16.sp),
          ),
          const Padding(padding: EdgeInsets.only(left: 6.0)),
          const Icon(
            Ionicons.chevron_forward,
            size: 18.0,
            color: Colors.black26,
          )
        ],
      ),
    ));
  }
}
