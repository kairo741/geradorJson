import 'package:gerador_json/core/model/json-fields.dart';

class Constants {
  static const String MODEL = "model";

  static const String ACTIVE = "A";
  static const String INACTIVE = "I";

  static const String TYPE_OBJECT = "Object";
  static const String TYPE_BOOLEAN = "Boolean";
  static const String TYPE_NUMBER = "Number";
  static const String TYPE_STRING = "String";
  static const String TYPE_NULL = "Null";
  static const String TYPE_ARRAY = "Array";

  static const String ROLE_USER = "ROLE_USER";
  static const String ROLE_MODERATOR = "ROLE_MODERATOR";
  static const String ROLE_ADMIN = "ROLE_ADMIN";

  ///BACK API
  static const String SERVER_IP = "https://gerador-json-back.loca.lt";
  static const String CREATE_USER_PATH = "/create";

  static final List<JsonFields> JSON_FIELDS_LIST = [
    JsonFields(
        id: 0,
        name: "MAIN JSON",
        childObjectStatus: "A",
        type: Constants.TYPE_BOOLEAN,
        mainJson: true),
    JsonFields(
        id: 0,
        name: "BOOLEAN TYPE",
        childObjectStatus: "A",
        fatherObjectName: "MAIN JSON",
        type: Constants.TYPE_BOOLEAN),
    JsonFields(
        id: 0,
        name: "NUMBER TYPE",
        childObjectStatus: "A",
        fatherObjectName: "MAIN JSON",
        type: Constants.TYPE_NUMBER),
    JsonFields(
        id: 0,
        name: "STRING TYPE",
        childObjectStatus: "A",
        fatherObjectName: "MAIN JSON",
        type: Constants.TYPE_STRING),
    JsonFields(
        id: 0,
        name: "ARRAY TYPE",
        childObjectStatus: "A",
        fatherObjectName: "MAIN JSON",
        type: Constants.TYPE_ARRAY),
    JsonFields(
        id: 0,
        name: "OBJECT TYPE",
        childObjectStatus: "A",
        fatherObjectName: "MAIN JSON",
        type: Constants.TYPE_OBJECT),
    JsonFields(
        id: 0,
        name: "OBJECT TYPE2",
        childObjectStatus: "A",
        fatherObjectName: "OBJECT TYPE",
        type: Constants.TYPE_OBJECT),
    JsonFields(
        id: 0,
        name: "NULL TYPE",
        childObjectStatus: "A",
        fatherObjectName: "OBJECT TYPE2",
        type: Constants.TYPE_NULL),
  ];

  static final List<JsonFields> JSON_FIELDS_TEST_LIST = [
    JsonFields(
        id: 0,
        name: "MAIN JSON",
        childObjectStatus: "A",
        type: Constants.TYPE_BOOLEAN,
        mainJson: true),
    JsonFields(
        id: 0,
        name: "BOOLEAN TYPE",
        childObjectStatus: "A",
        fatherObjectName: "MAIN JSON",
        type: Constants.TYPE_BOOLEAN),
    JsonFields(
        id: 0,
        name: "OBJECT TYPE",
        childObjectStatus: "A",
        fatherObjectName: "MAIN JSON",
        type: Constants.TYPE_OBJECT),
    JsonFields(
        id: 0,
        name: "OBJECT TYPE2",
        childObjectStatus: "A",
        fatherObjectName: "OBJECT TYPE",
        type: Constants.TYPE_OBJECT),
    JsonFields(
        id: 0,
        name: "NULL TYPE",
        childObjectStatus: "A",
        fatherObjectName: "OBJECT TYPE2",
        type: Constants.TYPE_NULL),
    JsonFields(
        id: 0,
        name: "NUMBER TYPE",
        childObjectStatus: "A",
        fatherObjectName: "MAIN JSON",
        type: Constants.TYPE_NUMBER),
  ];
}
