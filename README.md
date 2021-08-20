## Reason
Modern web applications communicate via Json, this small plugin aims to expose two interfaces for transforming an Object into Json and for an Object factory from Json


### Ideas:
We leave you free to decide how best to create your instances, but we think it's a good strategy to use packs of 3 to avoid the usual code.

In this case, we recommend the `json_serializable` package https://pub.dev/packages/json_serializable

## Usage
A simple usage example:

```dart
import 'package:jsonable_object/jsonable_object.dart';

class User implements IConvertToJson {
  final int id;

  const User(this.id);

  @override
  FutureOr<Map<String, dynamic>> toJson() {
    return {'id': id };
  }
}

class FactoryUser implements IFactoryObjectFromJson<User> {
  @override
  FutureOr<User> fromJson(FutureOr<Map<String, dynamic>> json) async {
    final map = await json;
    return User(map['id']);
  }

}

void main() async {
  final json = <String, int>{'id': 1}; // accept synchronous values
  final jsonFuture = Future.value(<String, int>{'id': 2}); // also accept futures

  final user = await FactoryUser().fromJson(json);
  final user2 = await FactoryUser().fromJson(jsonFuture);

  final convertedJson = await user.toJson();
  final convertedJson2 = await user2.toJson();

  print(json); // show {id: 1}
  print(convertedJson); // show {id: 1}

  print(jsonFuture); // Instance of 'Future<Map<String, int>>'
  print(convertedJson2); // show {id: 2}
}

```
