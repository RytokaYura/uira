extension TimeExtension on Duration {
  String toHourMinute() {
    final List<String> parts = [
      _getHourPart(),
      _getMinutePart(),
    ];

    parts.removeWhere((part) => part.isEmpty);

    if (parts.isEmpty) return '0m';

    return parts.join(' ');
  }

  String _getHourPart() {
    final int hours = inHours;
    if (hours > 0) return '${hours}h';
    return '';
  }

  String _getMinutePart() {
    final int minutes = inMinutes.remainder(60);
    if (minutes > 0) return '${minutes}m';

    return '';
  }

  String toHourSecond() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hour = twoDigits(inHours.remainder(60));
    final minutes = twoDigits(inMinutes.remainder(60));
    final seconds = twoDigits(inSeconds.remainder(60));
    return '$hour:$minutes:$seconds';
  }

  String toMinuteSecond() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(inMinutes.remainder(60));
    final seconds = twoDigits(inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}