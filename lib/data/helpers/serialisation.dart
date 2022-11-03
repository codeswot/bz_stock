class Serialization {
  static String? readStringValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key] as String?;
    } catch (e) {
      return null;
    }
  }

  static double? readDoubleValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key]?.toDouble();
    } catch (e) {
      return null;
    }
  }

  static int? readIntValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key] as int?;
    } catch (e) {
      return null;
    }
  }

  static bool? readBoolValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key] as bool?;
    } catch (e) {
      return null;
    }
  }

  static Map? readMapValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key] as Map?;
    } catch (e) {
      return null;
    }
  }

  static List? readListValue(Map<dynamic, dynamic> json, String key) {
    try {
      return json[key] as List?;
    } catch (e) {
      return null;
    }
  }
}
