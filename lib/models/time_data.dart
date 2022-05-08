class TimeData {
  int days;
  int hours;
  int minutes;
  int seconds;
  int accumSeconds;
  int dayPlus;
  TimeData(
      {required this.days,
      required this.hours,
      required this.minutes,
      required this.seconds,
      required this.accumSeconds,
      required this.dayPlus});
  // ? 팩토리 패턴, 이렇게 쓰는게 맞는지 몰겠네.
  factory TimeData.fromJson(Map json) {
    return TimeData(
        days: json['days'],
        hours: json['hours'],
        minutes: json['minutes'],
        seconds: json['seconds'],
        accumSeconds: json['accumSeconds'],
        dayPlus: json['dayPlus']);
  }
  factory TimeData.initilize() {
    return TimeData(
        days: 0, hours: 0, minutes: 0, seconds: 0, accumSeconds: 0, dayPlus: 0);
  }
}
