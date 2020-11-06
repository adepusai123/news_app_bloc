class SourceModel {
  SourceModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"] == null ? 'test' : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
      };
}
