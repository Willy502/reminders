class ReminderModel {

  int? id;
  String? name;
  String? detail;

  ReminderModel({
    this.id,
    this.name,
    this.detail,
  });

  factory ReminderModel.fromJson(Map<String, dynamic> json) => ReminderModel(
    id: json["id"],
    name: json["name"],
    detail: json["detail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "detail": detail,
  };
}