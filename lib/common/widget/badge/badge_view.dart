import 'package:badges/badges.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:dev_template_flutter/common/widget/badge/badge.dart';


class BadgeView<T extends BadgerProviderModel> extends StatelessWidget {
  const BadgeView(this.key,this.child) : super(key: key);

  final ValueKey<String> key;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // return Badge(
    //   animationType: BadgeAnimationType.scale,
    //   // showBadge: value.badgeText != null,
    //   padding: const EdgeInsets.all(4.0),
    //   elevation: 2.0,
    //   position: BadgePosition.topEnd(top: 0, end: -8),
    //   badgeContent: Consumer<BadgeMineModel> (builder: (context,value,child){
    //     return Text(value.badgeText??'', style: const TextStyle(fontSize: 8.0, color: Colors.white));
    //   },),
    //   child: child,
    // );

    return Consumer<T>(builder: (context,value,_) {
      return Badge(
        animationType: BadgeAnimationType.scale,
        padding: const EdgeInsets.all(4.0),
        elevation: 2.0,
        showBadge: value.badgeText != null,
        position: BadgePosition.topEnd(top: 0, end: -8),
        badgeContent: Text(value.badgeText??'', style: const TextStyle(fontSize: 8.0, color: Colors.white)),
        child: child,
      );
    });
  }
}
