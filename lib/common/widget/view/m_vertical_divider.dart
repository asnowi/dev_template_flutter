import 'package:dev_template_flutter/common/utils/utils.dart';

class MVerticalDivider extends StatelessWidget {

  MVerticalDivider({Key? key,this.width, this.thickness,this.indent,this.endIndent,this.color}) : super(key: key);

  double? width;
  double? thickness;
  double? indent;
  double? endIndent;
  Color? color;



  @override
  Widget build(BuildContext context) {
    return VerticalDivider(width: width?? 0.5, thickness: thickness?? 0.5, indent: indent?? 0.0, endIndent: endIndent?? 0.0,color: color?? Colors.black12);
  }
}
