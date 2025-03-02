import 'package:flutter/services.dart';

FilteringTextInputFormatter get numberFormatter =>
    FilteringTextInputFormatter.allow(
      RegExp(r'[0-9]'),
    );
