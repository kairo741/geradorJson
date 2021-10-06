class JsonFields {
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String TYPE = 'type';
  static const String OBJECT_NAME = 'object_name';
  static const String CHILD_OBJECT_STATUS = 'child_object_status';
  static const String MAIN_JSON = 'main_json';
  static const String USER_ID = 'user_id';
  static const String CONTENT = 'content';

  int? id;
  String? name;
  String? type; // TODO - TRANSFORMAR EM ENUM
  String? fatherObjectName;
  String? childObjectStatus;
  bool? mainJson;
  int? userId;
  dynamic content;

  JsonFields({
    this.id,
    this.name,
    this.type,
    this.fatherObjectName,
    this.childObjectStatus,
    this.mainJson,
    this.userId,
    this.content,
  });

  static JsonFields fromJson(Map<String, dynamic> json) => JsonFields(
        id: json[ID] as int?,
        name: json[NAME] as String?,
        type: json[TYPE] as String?,
        fatherObjectName: json[OBJECT_NAME] as String?,
        childObjectStatus: json[CHILD_OBJECT_STATUS] as String?,
        mainJson: json[MAIN_JSON] as bool?,
        userId: json[USER_ID] as int?,
        content: json[CONTENT],
      );

  Map<String, dynamic> toJson() {
    return {
      ID: this.id,
      NAME: this.name,
      TYPE: this.type,
      OBJECT_NAME: this.fatherObjectName,
      CHILD_OBJECT_STATUS: this.childObjectStatus,
      MAIN_JSON: this.mainJson,
      USER_ID: this.userId,
      CONTENT: this.content,
    };
  }
}
