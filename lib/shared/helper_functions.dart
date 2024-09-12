class Helpers {
  Helpers._();

  static const _months = {
    "01": "Jan",
    "02": "Feb",
    "03": "Mar",
    "04": "Apr",
    "05": "May",
    "06": "Jun",
    "07": "Jul",
    "08": "Aug",
    "09": "Sep",
    "10": "Oct",
    "11": "Nov",
    "12": "Dec",
  };

  static String formatDate(String? rawDate) {
    if (rawDate == null || rawDate == "") return "";
    final splited = rawDate.split("-");
    if (splited.length < 3) return "";
    return "${_months[splited[1]]} ${splited[2]}, ${splited[0]}";
  }
}
