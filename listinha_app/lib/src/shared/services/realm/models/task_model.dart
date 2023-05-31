import 'package:realm/realm.dart';

part 'task_model.g.dart';

part 'task_board_model.dart';

@RealmModel()
class _Task {
  @PrimaryKey()
  late Uuid id;
  late String description;
  bool completed = false;
}
