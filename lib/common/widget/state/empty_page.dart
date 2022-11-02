import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:lottie/lottie.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: 200,
          height: 300,
          alignment: Alignment.center,
          child: Column(
            children: [
              Lottie.asset(AssetsProvider.lottiePath('page_empty')),
              const Text('暂无数据',style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ))
            ],
          ),
        ),
      ),
    );
  }
}
