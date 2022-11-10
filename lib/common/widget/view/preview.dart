import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

typedef PageChanged = void Function(int index);

class PreviewWidget extends StatefulWidget {
  PreviewWidget(
      {Key? key,
      required this.galleryItems,
      required this.pageChanged,
      this.defaultImage = 0,
      this.direction = Axis.horizontal,
      this.decoration = const BoxDecoration(color: Colors.black)})
      : super(key: key);

  //图片列表
  final List<String> galleryItems;

  //切换图片回调
  final PageChanged pageChanged;

  //默认第几张
  int defaultImage;

  //图片查看方向
  final Axis direction;

  //背景设计
  final BoxDecoration decoration;

  @override
  State<PreviewWidget> createState() => _PreviewWidgetState();
}

class _PreviewWidgetState extends State<PreviewWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                  heroAttributes: PhotoViewHeroAttributes(tag: widget.galleryItems[index]),
                  imageProvider: NetworkImage(widget.galleryItems[index]),
                );
              },
              scrollDirection: widget.direction,
              itemCount: widget.galleryItems.length,
              backgroundDecoration: widget.decoration,
              pageController: PageController(initialPage: widget.defaultImage),
              onPageChanged: (index) => setState(() {
                  widget.defaultImage = index;
                  widget.pageChanged(index);
                },
              ),
              loadingBuilder: (context, event) => const Center(
                child: SpinKitCircle(color: Colors.blueAccent,size: 22.0,),
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: UIUtils.onAppBarCircleBack(onBack: () => Navigator.pop(context),iconColor: Colors.white),
            )
          ),
          Positioned(
            ///布局自己换
            right: 20,
            bottom: 20,
            child: Text(
              '${widget.defaultImage + 1}/${widget.galleryItems.length}',
              style: TextStyle(color: Colors.white,fontSize: 16.sp),
            ),
          )
        ],
      ),
    );
  }
}
