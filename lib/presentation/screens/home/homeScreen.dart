import 'package:client/presentation/screens/batch/addBatchScreen.dart';
import 'package:client/presentation/screens/batch/home/batch.dart';
import 'package:client/presentation/widgets/layouts/batchesWidget.dart';
import 'package:client/providers/batch/batch_Provider.dart';
import 'package:client/routes/routesName.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batchState = ref.watch(batchProvider);
    print(batchState.batches);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: Theme.of(context).colorScheme.onSurface,
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Colors.grey.shade700,
        title: Text.rich(TextSpan(
            text: 'Mkcl',
            style: const TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
                fontSize: 25),
            children: [
              TextSpan(
                  text: ' School',
                  style: TextStyle(color: Colors.grey.shade700))
            ])),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min, // Minimize modal to fit content
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.bug_report_outlined,
                            color: Colors.grey,
                          ),
                          title: Text(
                            'Developer Feedback',
                            style: TextStyle(color: Colors.grey),
                          ),
                          onTap: () {
                            // Handle delete action
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          title: Text(
                            'Sign Out',
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () {
                            // Handle share action
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                Routesname.signIn, ModalRoute.withName('/'));
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: batchState.isLoading
          // ? null
          ? const Center(
              child: Text(
                'no batch found please add the batch',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: batchState.batches.length,
              itemBuilder: (context, index) {
                final batch =
                    batchState.batches[index]; // Assuming batch is a BatchModel
                print(" this is the batch $batch");
                return InkWell(
                  onDoubleTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Batch(item: batchState.batches[index]),
                      ),
                    );
                  },
                  child: BatchesWidgets(
                    title:
                        batch.title, // Accessing title directly from the model
                    startDate: batch.startDate, // Format as needed
                    endDate: batch.endDate,
                    startTime:
                        batch.startTime, // Ensure this is formatted correctly
                    endTime: batch.endTime,
                  ),
                );
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        icon: const Center(
            child: Icon(
          Icons.add,
          size: 20,
        )),
        label: const Text('Add Batch'),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const AddBatchScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
