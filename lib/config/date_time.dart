extension DateTimeExtension on DateTime {
  String timeAgo({bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(this);
    final differenceYear = (difference.inDays / 360).floor();
    final differenceMonth = (difference.inDays / 30).floor();
    final differenceWeek = (difference.inDays / 7).floor();

    if ((difference.inDays / 360).floor() >= 1) {
      return (numericDates) ? '1 Tahun yang lalu' : ' 1 Tahun yang lalu';
    } else if ((difference.inDays / 360).floor() >= 2) {
      return '$differenceYear Tahun Yang Lalu';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return (numericDates) ? '1 bulan yang lalu' : ' 1 bulan yang lalu';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return '$differenceMonth Bulan Yang Lalu';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 minggu yang lalu' : '1 minggu yang lalu';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return '$differenceWeek Minggu yang lalu';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} Hari Yang Lalu';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 Hari Yang Lalu' : 'Kemarin';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} Jam Yang Lalu';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 Jam yang lalu' : '1 Jam yang lalu';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} Menit Yang Lalu';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 Menit Yang Lalu' : 'Bebera Menit Yang Lalu';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} Detik yang lalu';
    } else {
      return 'Baru Saja';
    }
  }
}
