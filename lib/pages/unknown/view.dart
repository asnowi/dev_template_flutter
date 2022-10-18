import 'package:dev_template_flutter/common/base/base.dart';
import 'package:flutter/material.dart';

import 'unknown.dart';

class UnknownView extends BaseGetView<UnknownController>{
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('未知页')),
    );
  }

}