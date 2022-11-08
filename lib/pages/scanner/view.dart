import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'scanner.dart';
import 'widget/widget.dart';

class ScannerView extends BaseGetView<ScannerController> {

  ScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Stack(
      children: [
        _buildQrView(context),
        Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 25.0),
          child: Positioned(
              child: UIUtils.onAppBarCircleBack(onBack: () => controller.onBack(),iconColor: Colors.white)),
        )
      ],
    );
  }

 // Widget _buildQrView(BuildContext context) {
 //   var scanArea = (MediaQuery.of(context).size.width < 400 ||
 //       MediaQuery.of(context).size.height < 400)
 //       ? 220.0
 //       : 300.0;
 //   return QRView(
 //     key: controller.qrKey,
 //     onQRViewCreated: _onQRViewCreated,
 //     overlay: QrScannerOverlayShape(
 //         borderColor: Colors.blueAccent,
 //         borderRadius: 2.0,
 //         borderLength: 30,
 //         borderWidth: 4.0,
 //         cutOutSize: scanArea),
 //     onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
 //   );
 // }

  Widget _buildQrView(BuildContext context) {
      final scanArea = (MediaQuery.of(context).size.width < 400 ||
          MediaQuery.of(context).size.height < 400)
          ? 220.0
          : 300.0;
    final shape = QrScannerOverlayShape(
              borderColor: Colors.blueAccent,
              borderRadius: 2.0,
              borderLength: 30,
              borderWidth: 4.0,
              cutOutSize: scanArea);
    return QrCoreScanWidget(scannerController: controller,qrScannerOverlayShape: shape);
  }

  void _onQRViewCreated(QRViewController qrViewController) {
      controller.qrViewController = qrViewController;
      if(controller.qrViewController != null) {
        controller.qrViewController?.scannedDataStream.listen((result) {
          if(result != null) {
            LogUtils.GGQ('======>>>${result.code}');
            controller.onScanResult(result);
          }
        });
      }
  }
}