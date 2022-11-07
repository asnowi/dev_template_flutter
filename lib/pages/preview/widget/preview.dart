import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/pages/preview/preview.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PreviewWidget extends StatelessWidget {
  PreviewWidget({Key? key, required this.controller}) : super(key: key);

  PreviewController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: GetBuilder<PreviewController>(
              id: 'preview',
              builder: (_) => controller.list.isEmpty ? const CircularProgressIndicator()
                  : Container(
                      child: PhotoViewGallery.builder(
                          itemCount: controller.list.length,
                          builder: (context, index) =>
                              PhotoViewGalleryPageOptions(
                                imageProvider:
                                    NetworkImage(controller.list[index].url??''),
                              )),
                    ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0),
            child: Positioned(
                child: UIUtils.onAppBarBack(onBack: () => controller.onBack(),iconColor: Colors.white)),
          ),
        ],
      ),
    );
  }
}
