
import 'dart:io';
import 'package:dev_template_flutter/pages/scanner/controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCoreScanWidget extends StatefulWidget {
  const QrCoreScanWidget(
      {Key? key,required this.scannerController,
        required this.qrScannerOverlayShape,
      }) : super(key: key);

  final ScannerController scannerController;
  final QrScannerOverlayShape qrScannerOverlayShape;

  @override
  State<QrCoreScanWidget> createState() => _QrCoreScanWidgetState();
}

class _QrCoreScanWidgetState extends State<QrCoreScanWidget> with TickerProviderStateMixin {

  /// 可重复播放，持续时间为3秒的动画控制器
  late final AnimationController _animation = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      widget.scannerController.qrViewController?.pauseCamera();
    } else if (Platform.isIOS) {
      widget.scannerController.qrViewController?.resumeCamera();
    }
  }

  @override
  void dispose() {
    _animation.dispose();
    widget.scannerController.qrViewController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        final Size biggest = constraints.biggest;

        final beginRect = RelativeRect.fromLTRB(100.w,0.h, 100.w, 200.h);

        final endRect = RelativeRect.fromLTRB(100.w,200.h, 100.w, 0.h);

        /// 补间动画
        final rectAnimation =
        RelativeRectTween(begin: beginRect, end: endRect)
            .animate(_animation);

        return Stack(
          children: [
            // 摄像头
            QRView(
              key: widget.scannerController.qrKey,
              overlay: widget.qrScannerOverlayShape,
              onQRViewCreated: (QRViewController controller) {
                widget.scannerController.qrViewController = controller;
                if (controller.hasPermissions) return;
                controller.scannedDataStream.listen((result) {
                  // 暂定相机
                  // widget.scannerController.qrViewController?.pauseCamera();
                  //--结果--->>>result
                  widget.scannerController.onScanResult(result);
                });
              },
              onPermissionSet: (ctrl, p) => widget.scannerController.onPermissionSet(context, ctrl, p),
            ),
            PositionedTransition(rect: rectAnimation,
            //  child: SvgPicture.asset(
            //   AssetsProvider.svgPath('qrcode_scan_line'),
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   color: Colors.redAccent,
            // ),
              child: Image.asset(AssetsProvider.imagePath('qrcode_scan_line')),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 25.0),
              child: Positioned(
                  child: UIUtils.onAppBarCircleBack(onBack: () => widget.scannerController.onBack(),iconColor: Colors.white)),
            )
          ],
        );
      },)
    );
  }
}
