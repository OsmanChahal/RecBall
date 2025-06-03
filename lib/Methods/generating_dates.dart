import 'package:intl/intl.dart';

List<DateTime> generatingDateRang() {
  DateTime now = DateTime.now().toLocal();
  DateTime today = DateTime(now.year, now.month, now.day);
  List<DateTime> dateList = [];

  for (int i = -7; i <= 7; i++) {
    dateList.add(today.add(Duration(days: i)));
  }

  return dateList;
}

String formatDate(DateTime date) {
  DateTime now = DateTime.now().toLocal();
  DateTime today = DateTime(now.year, now.month, now.day);
  DateTime yesterday = today.subtract(Duration(days: 1));
  DateTime tomorrow = today.add(Duration(days: 1));

  if (date.year == today.year &&
      date.month == today.month &&
      date.day == today.day) {
    return "Today";
  } else if (date.year == yesterday.year &&
      date.month == yesterday.month &&
      date.day == yesterday.day) {
    return "Yesterday";
  } else if (date.year == tomorrow.year &&
      date.month == tomorrow.month &&
      date.day == tomorrow.day) {
    return "Tomorrow";
  } else {
    // Format as [Mon 7 Apr] (adjust format as needed)
    return '${DateFormat('E').format(date)} ${date.day} ${DateFormat('MMM').format(date)}';
  }
}
