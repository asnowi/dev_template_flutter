import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/values/values.dart';
import 'package:dev_template_flutter/common/widget/dialog/dialog.dart';

import 'mine.dart';

class MineView extends BaseGetView<MineController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: GetBuilder<MineController>(
        id: 'user',
        builder: (_) => _buildContent(context)
      )
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 0.2.sh,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 30.h,
              left: AppDimens.slideGap,
              right: AppDimens.slideGap),
          child: controller.user == null ? _buildLoginHeader():_buildUserHeader(),
        ),
        AppStyles.getCommonDivider(),
        Container(
          width: getWidth(),
          height: 0.75.sh,
          child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) =>
              Container(
                constraints: constraints,
                child: controller.user == null? _buildLogin(context): _buildColumn(context)
              )
            ,),
        )
      ],
    );
  }


  Widget _buildLoginHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: ConstrainedBox(
            constraints: BoxConstraints.loose(const Size(64, 64)),
            child: Image.asset(AssetsProvider.imagePath('avatar_default')),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 8.w)),
        TextButton(onPressed: () => controller.onLogin(),
            style: AppStyles.getCommonButtonStyle(width: 100.w),
            child: const Text('请登录'))
      ],
    );
  }

  Widget _buildUserHeader() {
    return GestureDetector(
      onTap: () => controller.onUserInfo(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints.tight(const Size(64, 64)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.grey,width: .5),
            ),
            child: ImageLoader.load(url: controller.user?.avatarImg??''),
          ),
          const Padding(padding: EdgeInsets.only(left: 10.0)),
          Expanded(child: ListTile(
            title: Text(controller.user?.nickname??'',style: TextStyle(color: Colors.black87,fontSize: 16.sp,fontWeight: FontWeight.bold),maxLines: 1,softWrap:false,overflow: TextOverflow.ellipsis,),
            subtitle: Text(controller.user?.phone??'',style: TextStyle(color: Colors.black45,fontSize: 12.sp),maxLines: 1,softWrap:false,overflow: TextOverflow.ellipsis,),
          ))
        ],
      ),
    );
  }

  Widget _buildLogin(BuildContext context) {
    return Column(
      children: [
        Flexible(child: Container()),
        Flexible(child: TextButton(onPressed: () => controller.onLogin(),
            style: AppStyles.getCommonButtonStyle(width: getWidth() * 0.75, height: 52.h),
            child: const Text('请登录')))
      ],
    );
  }
  Widget _buildColumn(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: Column(
        children: [
          _buildItem('收藏',Ionicons.color_palette_outline,() => ToastUtils.show('收藏')),
          AppStyles.getCommonDivider(indent: 30.w),
          _buildItem('卡包',Ionicons.color_palette_outline,(){}),
          AppStyles.getCommonDivider(indent: 30.w),
          _buildItem('Web',Ionicons.color_palette_outline,() => controller.openWebView(context)),
          AppStyles.getCommonDivider(indent: 30.w),
          _buildItem('设置',Ionicons.color_palette_outline,() => PermissionDialog.show(context)),
          Container(
            margin: EdgeInsets.only(top: 100.h),
            child: TextButton(onPressed: () => controller.onLogout(),
                style: AppStyles.getCommonButtonStyle(width: getWidth() * 0.75, height: 48.h),
                child: const Text('退出登录')),
          )
        ],
      ),
    );
  }

  Widget _buildItem(String title,IconData icon,Function click, {bool isNext = true}) {
    return InkWell(
        onTap: () => click(),
        splashColor: Colors.grey[100],
        focusColor: Colors.grey[100],
        highlightColor: Colors.grey[100],
        child: Container(
          height: 52.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              _buildLeading(icon),
              _buildText(title),
              if(isNext) _buildEnding(Ionicons.chevron_forward)
            ],
          ),
        )
    );
  }

  Widget _buildLeading(IconData icon) {
    return Icon(icon, size: 22.0, color: Colors.black87,);
  }

  Widget _buildText(String text) {
    return Expanded(flex: 1,child: Padding(padding: const EdgeInsets.only(left: 10.0),child: Text(text,style: TextStyle(fontSize: 16.sp,color: Colors.black87),),));
  }

  Widget _buildEnding(IconData icon) {
    return Icon(icon, size: 18.0, color: Colors.black26,);
  }
}
