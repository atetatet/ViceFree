import 'package:intl/intl.dart';

String formatToMMDDYYYY(DateTime date) {
  final format = DateFormat('MM/dd/yyyy');
  return format.format(date);
}

String formatToDateTimeString(String dateString) {
  DateTime dateTime;
  try {
    dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
  } catch (e) {
    dateTime = DateTime.parse(dateString);
  }
  String formattedDate = DateFormat('MM-dd-yyyy HH:mm:ss a').format(dateTime);
  return formattedDate;
}

// String timeAgo(int timestamp) {
//   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
//   DateTime now = DateTime.now();

//   Duration difference = now.difference(dateTime);

//   if (difference.inSeconds < 60) {
//     return '${difference.inSeconds} second${difference.inSeconds == 1 ? '' : 's'} ';
//   } else if (difference.inMinutes < 60) {
//     return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ';
//   } else if (difference.inHours < 24) {
//     return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ';
//   } else if (difference.inDays < 30) {
//     return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ';
//   } else if (difference.inDays < 365) {
//     return '${(difference.inDays / 30).round()} month${(difference.inDays / 30).round() == 1 ? '' : 's'} ago';
//   } else {
//     return '${(difference.inDays / 365).round()} year${(difference.inDays / 365).round() == 1 ? '' : 's'} ago';
//   }
// }

String timeAgo(int timestamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  DateTime now = DateTime.now();

  int years = now.year - dateTime.year;
  int months = now.month - dateTime.month;
  int days = now.day - dateTime.day;
  int hours = now.hour - dateTime.hour;
  int minutes = now.minute - dateTime.minute;
  int seconds = now.second - dateTime.second;

  if (seconds < 0) {
    seconds += 60;
    minutes -= 1;
  }
  if (minutes < 0) {
    minutes += 60;
    hours -= 1;
  }
  if (hours < 0) {
    hours += 24;
    days -= 1;
  }
  if (days < 0) {
    final prevMonth = DateTime(now.year, now.month, 0);
    days += prevMonth.day;
    months -= 1;
  }
  if (months < 0) {
    months += 12;
    years -= 1;
  }

  List<String> parts = [];

  if (years > 0) parts.add('$years year${years == 1 ? '' : 's'}');
  if (months > 0) parts.add('$months month${months == 1 ? '' : 's'}');
  if (days > 0) parts.add('$days day${days == 1 ? '' : 's'}');
  if (hours > 0) parts.add('$hours hour${hours == 1 ? '' : 's'}');
  if (minutes > 0) parts.add('$minutes minute${minutes == 1 ? '' : 's'}');
  if (seconds > 0 || parts.isEmpty) {
    parts.add('$seconds second${seconds == 1 ? '' : 's'}');
  }

  return '${parts.join(', ')} ago';
}

int stringDateToTimestamp(String dateString) {
  DateTime dateTime;

  try {
    dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateString);
  } catch (e) {
    dateTime = DateTime.parse(dateString);
  }

  return (dateTime.millisecondsSinceEpoch ~/ 1000).round();
}

String formatTimestamp(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('MMMM d, y').format(date); // May 16, 2025
}

String formatToDateTimeStringWithFormatMMDDYYY(String dateString) {
  DateTime dateTime;
  try {
    dateTime = DateFormat('MM/dd/yyyy').parse(dateString);
  } catch (e) {
    dateTime = DateTime.parse(dateString);
  }
  String formattedDate = DateFormat('MM/dd/yyyy').format(dateTime);
  return formattedDate;
}

String formatToDateTimeStringWithFormatMMDD(String dateString) {
  try {
    String formattedDate = '';
    DateTime dateTime = DateTime.parse(dateString);
    DateTime now = DateTime.now();

    // Convert dateTime to UTC and adjust for Philippine Time (UTC +8)
    DateTime phTimeNow = dateTime.add(const Duration(hours: 8));

    // Compare only date (ignoring time)
    if (phTimeNow.year == now.year &&
        phTimeNow.month == now.month &&
        phTimeNow.day == now.day) {
      int timestamp = (phTimeNow.millisecondsSinceEpoch ~/ 1000)
          .round(); // Convert to timestamp
      formattedDate = timeAgo(timestamp);
    } else {
      formattedDate = DateFormat('MMM d').format(dateTime);
    }

    return formattedDate;
  } catch (e) {
    // If parsing fails, try alternative format
    try {
      DateTime dateTime = DateTime.parse(dateString);
      return DateFormat('MMM d').format(dateTime);
    } catch (_) {
      return 'Invalid date';
    }
  }
}
