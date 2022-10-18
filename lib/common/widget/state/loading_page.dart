
import 'package:dev_template_flutter/common/utils/utils.dart';

class LoadingPage extends StatelessWidget {

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
