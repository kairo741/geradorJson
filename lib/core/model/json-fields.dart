class JsonFields {
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String TYPE = 'type';
  static const String OBJECT_NAME = 'object_name';
  static const String CHILD_OBJECT_STATUS = 'child_object_status';

  int? id;
  String? name;
  String? type; // TODO - TRANSFORMAR EM ENUM
  String? childObjectName;
  String? childObjectStatus;

  JsonFields({
    this.id,
    this.name,
    this.type,
    this.childObjectName,
    this.childObjectStatus,
  });

  static JsonFields fromJson(Map<String, dynamic> json) => JsonFields(
        id: json[ID] as int?,
        name: json[NAME] as String?,
        type: json[TYPE] as String?,
        childObjectName: json[OBJECT_NAME] as String?,
        childObjectStatus: json[CHILD_OBJECT_STATUS] as String?,
      );

  Map<String, dynamic> toJson() {
    return {
      ID: this.id,
      NAME: this.name,
      TYPE: this.type,
      OBJECT_NAME: this.childObjectName,
      CHILD_OBJECT_STATUS: this.childObjectStatus,
    };
  }
}
