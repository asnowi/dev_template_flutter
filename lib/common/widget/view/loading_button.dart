import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingButton extends StatefulWidget {
  LoadingButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.loadingText,
    this.textStyle,
    this.width,
    this.height,
    this.loadingColor,
    this.buttonStyle,
  }) : super(key: key);

  String text;
  Function onPressed;
  String? loadingText;
  TextStyle? textStyle;
  double? width;
  double? height;
  Color? loadingColor;
  ButtonStyle? buttonStyle;
  bool isLoading = false;

  _LoadingButtonState? _state;

  @override
  State<LoadingButton> createState() {
    _state = _LoadingButtonState();
    return _state!;
  }

  void onCancel() {
    _state?.reset();
  }

  void onLoading() {
    _state?.loading();
  }
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width ?? getWidth() / 3,
        height: widget.height ?? 38.h,
        child: TextButton(
          style: widget.buttonStyle ??
              ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.focused) &&
                        !states.contains(MaterialState.pressed)) {
                      return Colors.grey[300];
                    } else if (states.contains(MaterialState.pressed)) {
                      return Colors.white60;
                    }
                    return Colors.white;
                  },
                ),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.blueAccent[100];
                  }
                  return widget.isLoading
                      ? Colors.blue[100]
                      : Colors.blueAccent[100];
                }),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                )),
              ),
          onPressed: () {
            if (!widget.isLoading) {
              widget.onPressed(context);
            }
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: Row(
              key: ValueKey<bool>(widget.isLoading),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: widget.isLoading,
                  maintainState: false,
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: SpinKitRing(
                      color: widget.loadingColor ?? Colors.white60,
                      size: 13.0,
                      lineWidth: 1.0,
                    ),
                  ),
                ),
                Visibility(
                    visible: widget.isLoading,
                    maintainState: false,
                    child: const Padding(padding: EdgeInsets.only(right: 6))),
                Text(
                    widget.isLoading
                        ? widget.loadingText ?? '请稍后...'
                        : widget.text,
                    style: widget.textStyle),
              ],
            ),
          ),
        ));
  }

  void loading() {
    setState(() {
      widget.isLoading = true;
    });
  }

  void reset() {
    setState(() {
      widget.isLoading = false;
    });
  }
}
