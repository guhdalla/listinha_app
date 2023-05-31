import 'package:flutter_test/flutter_test.dart';
import 'package:listinha_app/src/home/widgets/task_card.dart';
import 'package:listinha_app/src/shared/services/realm/models/task_model.dart';
import 'package:realm/realm.dart';

void main() {
  final board = TaskBoard(
    Uuid.v4(),
    'Nova lista de tarefas 1',
  );

  testWidgets('testGetProgess', (tester) async {
    final tasks = [
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
    ];

    final progress = TaskCard(board: board).getProgress(tasks);

    expect(progress, 0.5);
  });

    testWidgets('testGetProgessText', (tester) async {
    final tasks = [
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), '', completed: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
    ];

    final progress = TaskCard(board: board).getProgressText(tasks);

    expect(progress, '2/4');
  });
}
