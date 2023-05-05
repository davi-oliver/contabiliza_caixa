import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ga_proj/global/globals_animations.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlobalsFunctions {
  // declare build context
  BuildContext context;
  GlobalsFunctions(this.context);
  Future<bool> verificaInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // nao tem conexao
      return false;
    }
    // tem conexao
    return true;
  }
}

const kBreakpointSmall = 479.0;
const kBreakpointMedium = 767.0;
const kBreakpointLarge = 991.0;
DateTime get getCurrentTimestamp => DateTime.now();

bool responsiveVisibility({
  required BuildContext context,
  bool phone = true,
  bool tablet = true,
  bool tabletLandscape = true,
  bool desktop = true,
}) {
  final width = MediaQuery.of(context).size.width;
  if (width < kBreakpointSmall) {
    return phone;
  } else if (width < kBreakpointMedium) {
    return tablet;
  } else if (width < kBreakpointLarge) {
    return tabletLandscape;
  } else {
    return desktop;
  }
}

String dateTimeFormat(String format, DateTime? dateTime, {String? locale}) {
  if (dateTime == null) {
    return '';
  }
  if (format == 'relative') {
    return timeago.format(dateTime, locale: locale);
  }
  return DateFormat(format, locale).format(dateTime);
}
