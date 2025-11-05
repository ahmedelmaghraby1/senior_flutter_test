import 'package:flutter/material.dart';
import 'package:senior_flutter_test/core/enums/trip_status_enum.dart';
import 'package:senior_flutter_test/core/extensions/theme.dart';

TripStatus setTripStatus({required String status}) {
  if (status == 'Proposal Sent') {
    return TripStatus.sent;
  } else if (status == 'Pending Approval') {
    return TripStatus.pending;
  } else if (status == 'Ready for travel') {
    return TripStatus.ready;
  }
  return TripStatus.other;
}

Color setTripStatusColor({
  required BuildContext context,
  required TripStatus status,
}) {
  switch (status) {
    case TripStatus.sent:
      return context.appColor.secondaryColor;
    case TripStatus.pending:
      return context.appColor.brown;
    case TripStatus.ready:
      return context.appColor.turquoise;
    default:
      return context.appColor.successColor;
  }
}
