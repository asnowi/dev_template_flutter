import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';

import 'search.dart';

class SearchView extends BaseGetView<SearchController> {
  
  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: _buildSearch(context),
            leading: UIUtils.onAppBarBack(iconColor: Colors.white,onBack: () => controller.onBack())),
        body: _buildContent(context));
  }

  Widget _buildSearch(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 42.h),
          child: GetBuilder<SearchController>(
            id: 'search',
            builder: (_) => TextField(
              controller: controller.searchController,
              maxLines: 1,
              autocorrect: true,//是否自动更正
              // autofocus: true,//是否自动对焦
              textAlign: TextAlign.start,//文本对齐方式
              keyboardType: TextInputType.phone,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                hintText: '请输入搜索内容',
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white38,
                ),
                prefixIcon: const Icon(Ionicons.search,color: Colors.blueAccent,size: 14.0),
                suffixIcon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: controller.isSearch? IconButton(
                      splashRadius: 16.0,
                      icon: const Icon(Icons.close,color: Colors.blueAccent, size: 16.0), onPressed: (){
                    controller.searchController.clear();
                    controller.setSearch(false);
                  }): const SizedBox(),
                ),
                // contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.white60,
              ),
              onChanged: (text) {//内容改变的回调
                LogUtils.GGQ('-----搜索------>>${text}');
                controller.setSearch(text.isNotEmpty);
              },
              onSubmitted: (text) {//内容提交(按回车)的回调
                LogUtils.GGQ('搜索 onSubmitted:${text}');
              },
            ),
          ),
        ),),
        Padding(padding:EdgeInsets.symmetric(horizontal: 10.0.w)),
        TextButton(onPressed: () => ToastUtils.show('msg'),
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
              )),
              foregroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                  if (states.contains(MaterialState.focused) &&
                      !states.contains(MaterialState.pressed)) {
                    return Colors.grey[300];
                  } else if (states.contains(MaterialState.pressed)) {
                    return Colors.white60;
                  }
                  return Colors.white;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.blueAccent[100];
                }
                return Colors.blueAccent[100];
              }),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              )),
            ),
            child: Text('搜索'))
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Center(
        child: Container(
          constraints: BoxConstraints.tight(screenSize()),
          child: Column(
            children: [
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
              Text('1'),
            ],
          ),
        ),
      ),
    );
  }
}