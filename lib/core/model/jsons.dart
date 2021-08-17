import 'package:gerador_json/core/model/json-fields.dart';

class Jsons {
  static const String ID = 'id';
  static const String FIELDS = 'fields';

  int? id;
  List<JsonFields>? fields;

  Jsons({
    this.id,
    this.fields,
  });

  static Jsons fromJson(Map<String, dynamic> json) => Jsons(
        id: json[ID] as int?,
        fields: json[FIELDS] != null
            ? (json[FIELDS].map<JsonFields>((e) => JsonFields.fromJson(e)))
                .toList()
            : [],
      );

  Map<String, dynamic> toJson() {
    return {
      ID: this.id,
      FIELDS: this.fields ?? this.fields!.map((i) => i.toJson()).toList(),
    };
  }
}
