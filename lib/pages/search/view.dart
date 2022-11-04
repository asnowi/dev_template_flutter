import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/view/view.dart';
import 'package:dev_template_flutter/pages/search/widget/widget.dart';

import 'search.dart';

class SearchView extends BaseGetView<SearchController> {
  
  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar(controller: controller),
        body: _buildContent(context));
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Center(
        child: Container(
          constraints: BoxConstraints.tight(screenSize()),
          // child: _buildNoData(),
          child: _buildComData(),
        ),
      ),
    );
  }

  Widget _buildNoData() {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 0.2.sh),
      child: Column(
        children: [
          Icon(Ionicons.file_tray_outline,size: 64.0,color: Colors.blueAccent.withAlpha(64),),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
          Text('无数据',style: TextStyle(fontSize: 14.sp,color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildComData() {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 10.0),child: Align(
          alignment: Alignment.centerLeft,
          child: IconText(
            alignment: MainAxisAlignment.start,
            icon: const Icon(Ionicons.flower_outline,color: Colors.redAccent,size: 32.0,),
            text: Text('Hot',style: TextStyle(color: Colors.redAccent,fontSize: 22.sp,fontWeight: FontWeight.bold),),
            padding: const Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
          ),
        ),),
        Container(
          color: Colors.white,
          constraints: BoxConstraints.tightFor(width: 1.0.sw),
          child: _buildHot(),
        ),
        Expanded(child: Container(
          constraints: const BoxConstraints.expand(),
          child: _buildRecord(),
        )),
      ],
    );
  }

  Widget _buildHot() {
    return Wrap(
      children: [
        _buildHotItem('111111'),
        _buildHotItem('22'),
        _buildHotItem('3333333333333'),
        _buildHotItem('444444'),
        _buildHotItem('55555'),
        _buildHotItem('66666666666666666'),
        _buildHotItem('777777'),
        _buildHotItem('8888'),
        _buildHotItem('999999999'),
        _buildHotItem('101010'),
        _buildHotItem('11111111111111111111'),
        _buildHotItem('121212'),
        _buildHotItem('1313'),
        _buildHotItem('14'),
        _buildHotItem('15151515'),
        _buildHotItem('161616'),
        _buildHotItem('171717171717171717'),
      ],
    );
  }

  Widget _buildHotItem(String title) {
    return InkWell(
      onTap: () => ToastUtils.show(title),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 6.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
        decoration: BoxDecoration(
            color: Colors.red.withAlpha(16),
            borderRadius: BorderRadius.circular(6.0)
        ),
        child: Text(title,selectionColor: Colors.redAccent,style: TextStyle(color: Colors.redAccent.shade400),),
      ),
    );
  }

  Widget _buildRecord() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () => ToastUtils.show(index.toString()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12.0),
          child: Text(index.toString(),style: const TextStyle(color: Colors.black),),
        ),
      ),
      itemCount: 10,
    );
  }

}