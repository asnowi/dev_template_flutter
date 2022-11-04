import 'package:dev_template_flutter/common/base/base.dart';
import 'package:dev_template_flutter/common/utils/utils.dart';

import 'location.dart';

class LocationView extends BaseGetView<LocationController> {

  LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('location'),
      ),
    );
  }

}