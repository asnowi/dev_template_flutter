
import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/pages/search/search.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget{

  SearchBar({Key? key,required this.controller}) : super(key: key);

  final SearchController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      alignment: Alignment.bottomCenter,
      color: const Color(0xFF216FF6),
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: UIUtils.onAppBarBack(iconColor: Colors.white,onBack: () => controller.onBack()),
          ),
          Expanded(child: SizedBox(
            height: 40.h,
            child: GetBuilder<SearchController>(
              id: 'search',
              builder: (_) => TextField(
                controller: controller.inputController,
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
                      controller.inputController.clear();
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
          TextButton(onPressed: () => ToastUtils.show(controller.inputController.text),
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
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(58.0.h);

}
