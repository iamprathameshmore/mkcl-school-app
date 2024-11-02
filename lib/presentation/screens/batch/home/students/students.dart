import 'package:client/providers/student/student_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StudentsScreen extends ConsumerStatefulWidget {
  final int id;

  const StudentsScreen({super.key, required this.id});

  @override
  _StudentsScreenState createState() => _StudentsScreenState();
}

class _StudentsScreenState extends ConsumerState<StudentsScreen> {
  late TextEditingController nameController;
  late TextEditingController rollNoController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    rollNoController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    rollNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final studentList = ref.watch(studentListProvider(widget.id));

    return Scaffold(
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          final student = studentList[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
                student.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text("Roll No: ${student.studentId}"),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () {
                  // ref
                  //     .read(studentListProvider.notifier)
                  //     .deleteStudent(student.studentId);
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo.shade500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Add Student"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: rollNoController,
                      decoration: const InputDecoration(
                        labelText: "Roll No",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String name = nameController.text;
                      String rollNoText = rollNoController.text;

                      if (name.isEmpty || rollNoText.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Name and Roll No cannot be empty"),
                          ),
                        );
                        return;
                      }

                      int? rollNo = int.tryParse(rollNoText);

                      if (rollNo == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter a valid roll number"),
                          ),
                        );
                        return;
                      }
                      try {
                        print('this is widget id ${widget.id}');
                        ref
                            .read(studentListProvider(widget.id).notifier)
                            .addStudent(name, widget.id, rollNo);

                        nameController.clear();
                        rollNoController.clear();
                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        label: Text(
          'Add Students',
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        icon: Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
