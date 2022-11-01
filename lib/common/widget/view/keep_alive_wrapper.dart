import 'package:dev_template_flutter/common/utils/utils.dart';

class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({Key? key,required this.child}) : super(key: key);

  final Widget? child;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child?? Container(color: Colors.grey);
  }

  @override
    bool get wantKeepAlive => true;
}
