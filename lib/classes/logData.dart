class LogData{
  String status;
  String message;
  String log;

  LogData({
    this.status,
    this.message,
    this.log
});

  factory LogData.fromJson(Map<String, dynamic> json){
    return LogData(
      status: json["status"],
      message: json["message"],
      log: json["log"],
    );
  }
}