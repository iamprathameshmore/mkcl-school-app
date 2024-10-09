// ignore: file_names

import 'package:client/data/database/sql_helper.dart';
import 'package:client/presentation/screens/batch/addBatchScreen.dart';
import 'package:client/presentation/screens/batch/batch.dart';
import 'package:client/presentation/screens/profile/profileScreen.dart';

import 'package:client/presentation/widgets/layouts/batchesWidget.dart';
import 'package:client/providers/batch/batch_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batchState = ref.watch(batchProvider);
    final batchNotifier = ref.read(batchProvider.notifier);

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
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.indigo.shade600,
                    borderRadius: BorderRadius.circular(50)),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/91453437?v=4'),
                  ),
                ),
              )),
          const SizedBox(
            width: 10,
          )
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
                return InkWell(
                  onDoubleTap: () {
                    print('itemId:${batchState.batches[index]}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Batch(item: batchState.batches[index]),
                      ),
                    );
                  },
                  child: BatchesWidgets(
                    title: '${batchState.batches[index]['title']}',
                    desc: '${batchState.batches[index]['desc']}',
                    startDate: '${batchState.batches[index]['start_date']}',
                    endDate: '${batchState.batches[index]['end_date']}',
                    startTime: '${batchState.batches[index]['start_time']}',
                    endTime: '${batchState.batches[index]['end_time']}',
                  ),
                );
              }),
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
