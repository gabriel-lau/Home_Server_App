class LogData{
  bool online;
  String message;
  String log;

  LogData({
    this.online,
    this.message,
    this.log
});

  factory LogData.fromJson(Map<String, dynamic> json){
    return LogData(
      online: json["online"],
      message: json["message"],
      log: json["log"],
    );
  }
}