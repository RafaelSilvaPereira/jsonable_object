import 'dart:async';

abstract class IConvertToJson {
  const IConvertToJson();
  FutureOr<Map<String, dynamic>> toJson();
}

abstract class IFactoryObjectFromJson<T extends IConvertToJson> {
  const IFactoryObjectFromJson();
  FutureOr<T> fromJson(FutureOr<Map<String, dynamic>> json);
}







