import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Place {
  late String id;
  late String title;

  Place({required title}) : id = uuid.v4();
}
