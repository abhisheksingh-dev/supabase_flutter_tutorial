class TerminalModel {
  late DateTime dateTime;
  late String msg;
  late int priority; //Priority of msg

  TerminalModel({
    required this.dateTime,
    required this.msg,
    required this.priority,
  });
}
