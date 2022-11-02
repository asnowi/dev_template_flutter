
import 'package:dev_template_flutter/common/utils/utils.dart';

class IconText extends StatelessWidget {
  IconText({Key? key,required this.icon,required this.text,this.padding,this.alignment}) : super(key: key);

  Icon icon;
  Text text;
  Padding? padding;
  MainAxisAlignment? alignment;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment?? MainAxisAlignment.center,
      children: [
        icon,
        padding?? const Padding(padding: EdgeInsets.symmetric(horizontal: 2.0)),
        text
      ],
    );
  }
}
