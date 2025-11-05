import 'package:intl/intl.dart';

String formatDateRange(String startApiDate, String endApiDate) {
  // Parse the API date format (dd-MM-yyyy)
  final inputFormat = DateFormat('dd-MM-yyyy');
  final startDate = inputFormat.parse(startApiDate);
  final endDate = inputFormat.parse(endApiDate);

  // Format to display format
  final outputFormat = DateFormat('MMM d');
  final yearFormat = DateFormat('y');

  final startMonthDay = outputFormat.format(startDate);
  final endMonthDay = outputFormat.format(endDate);
  final year = yearFormat.format(startDate);

  return '($startMonthDay - $endMonthDay, $year)';
}
