import 'package:dev_template_flutter/common/app/app.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/values/values.dart';
import 'package:dev_template_flutter/common/widget/dialog/dialog.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';
import 'package:dev_template_flutter/pages/home/nav/mine/mine.dart';

class OnUserWidget extends StatelessWidget {

  OnUserWidget({Key? key,
    required this.controller
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
            child: GestureDetector(
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
                    child: ImageLoader.load(url: Global.user?.avatarImg??''),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10.0)),
                  Expanded(child: ListTile(
                    title: Text(Global.user?.nickname??'',style: TextStyle(color: Colors.black87,fontSize: 16.sp,fontWeight: FontWeight.bold),maxLines: 1,softWrap:false,overflow: TextOverflow.ellipsis,),
                    subtitle: Text(Global.user?.phone??'',style: TextStyle(color: Colors.black45,fontSize: 12.sp),maxLines: 1,softWrap:false,overflow: TextOverflow.ellipsis,),
                  ))
                ],
              ),
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
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      child: Column(
                        children: [
                          _buildItem('提交',Ionicons.color_palette_outline,() => controller.showSubmitDialog()),
                          MDivider(indent: 30.w),
                          _buildItem('模式',Ionicons.color_palette_outline,() => controller.switchThemeModel()),
                          MDivider(indent: 30.w),
                          _buildItem('Web',Ionicons.color_palette_outline,() => controller.openWebView(context)),
                          MDivider(indent: 30.w),
                          _buildItem('设置1',Ionicons.color_palette_outline,() => PermissionDialog.show(() => {
                            controller.openSetting()
                          })),
                          MDivider(indent: 30.w),
                          _buildItem('设置2',Ionicons.color_palette_outline,() => controller.openSetting()),
                          MDivider(indent: 30.w),
                          _buildItem('loading',Ionicons.add_circle,() => controller.openTest()),
                          Container(
                            margin: EdgeInsets.only(top: 100.h),
                            child: TextButton(onPressed: () => controller.onLogout(),
                                style: AppStyles.getCommonButtonStyle(width: getWidth() * 0.75, height: 48.h),
                                child: const Text('退出登录')),
                          )
                        ],
                      ),
                    ),
                  ),
            ),
          ),
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
