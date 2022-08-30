String dateWithOutHyphen() {
  DateTime now = DateTime.now();
  return now.toString().replaceAll("-", "").substring(0, 21);
}
