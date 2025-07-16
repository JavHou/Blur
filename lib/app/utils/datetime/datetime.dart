String toHumanReadableDateTime(DateTime dateTime) {
  final dayString = '${dateTime.day.toString().padLeft(2, '0')}';
  final monthString = _monthToString(dateTime.month);
  final yearString = dateTime.year.toString().padLeft(4, '0');
  final hourString = dateTime.hour.toString().padLeft(2, '0');
  final minuteString = dateTime.minute.toString().padLeft(2, '0');

  return '$monthString $dayString, $yearString $hourString:$minuteString';
}

String _monthToString(int month) {
  const months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  return months[month - 1];
}

String _dayToString(int day) {
  const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
  return days[day - 1];
}
