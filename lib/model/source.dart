class SourceModel {
  SourceModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );
}
