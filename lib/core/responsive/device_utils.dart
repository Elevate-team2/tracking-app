import 'package:flutter/material.dart';
import 'package:tracking_app/core/responsive/size_helper_extension.dart';

class DeviceUtils {
  static bool isMobile(BuildContext context) {
    return context.screenWidth < 600;
  }

  static bool isTablet(BuildContext context) {
    return context.screenWidth >= 600 && context.screenWidth< 1200;
  }

  static bool isDesktop(BuildContext context) {
    return context.screenWidth >= 1200;
  }

  static valueDecider<T>(
    BuildContext context, {
    required T onMobile,
    T? onTablet,
    T? onDesktop,
    T? others,
  }) {
    if (isMobile(context)) {
      return onMobile;
    } else if (isDesktop(context) && onDesktop != null) {
      return onDesktop;
    } else if (isTablet(context) && onTablet != null) {
      return onTablet;
    }

    return others ?? onMobile;
  }
}
