import 'package:custom_timer/custom_timer.dart';
import 'package:divar_aviz/config/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class ResendCodeWidget extends StatefulWidget {
  final VoidCallback? onResendCode;

  const ResendCodeWidget({
    super.key,
    required this.onResendCode,
  });

  @override
  State<ResendCodeWidget> createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget>
    with SingleTickerProviderStateMixin {
  late final CustomTimerController _controller;

  int maxWaitingTime = 2;

  @override
  void initState() {
    super.initState();
    _controller = CustomTimerController(
      vsync: this,
      begin: Duration(minutes: maxWaitingTime),
      end: const Duration(),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.milliseconds,
    );

    _controller.start();

    _controller.addListener(() {
      if (maxWaitingTime == 0) {
        setState(() => maxWaitingTime = 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (_canRequestResendCode()) {
            widget.onResendCode?.call();

            setState(() {
              maxWaitingTime = maxWaitingTime;
              _controller.reset();
              _controller.start();
            });
          } else {
            null;
          }
        },
        child: CustomTimer(
          controller: _controller,
          builder: (state, time) {
            maxWaitingTime = time.duration.inSeconds;
            String timerText = '';
            if (maxWaitingTime > 0) {
              timerText = '${time.minutes} : ${time.seconds}';
            }
            return _canRequestResendCode()
                ? Text(
                    'ارسال مجدد',
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'مانده تا دریافت مجدد کد   ',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: ColorNeutral.mediumGrey),
                      ),
                      Text(
                        timerText,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: ColorPrimary.mainColor),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  bool _canRequestResendCode() {
    return (maxWaitingTime <= 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
