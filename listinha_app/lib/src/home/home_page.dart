import 'package:flutter/material.dart';
import 'package:listinha_app/src/home/widgets/custom_drawer.dart';
import 'package:listinha_app/src/home/widgets/task_card.dart';
import 'package:listinha_app/src/shared/services/realm/models/task_model.dart';
import 'package:listinha_app/src/shared/widgets/user_image_button.dart';
import 'package:realm/realm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('LISTINHA'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.only(
                top: 50,
                left: 30,
                right: 30,
                bottom: 200,
              ),
              itemCount: 100,
              itemBuilder: (_, index) {
                final model = TaskBoard(
                  Uuid.v4(),
                  'Nova lista de tarefas 1',
                  tasks: [
                    Task(Uuid.v4(), ''),
                    Task(Uuid.v4(), ''),
                    Task(Uuid.v4(), ''),
                    Task(Uuid.v4(), ''),
                  ],
                );
                return TaskCard(
                  board: model,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SegmentedButton<int>(
                  segments: const [
                    ButtonSegment<int>(label: Text('Todos'), value: 0),
                    ButtonSegment<int>(label: Text('Pendentes'), value: 1),
                    ButtonSegment<int>(label: Text('Concluídas'), value: 2),
                    ButtonSegment<int>(label: Text('Desativadas'), value: 3),
                  ],
                  selected: const {0},
                  onSelectionChanged: (values) {},
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit),
        label: const Text('Nova lista'),
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
      ),
    );
  }
}
