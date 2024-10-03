// ignore: file_names
import 'package:client/presentation/providers/batchesProviders.dart';
import 'package:client/presentation/screens/batch/addBatchScreen.dart';
import 'package:client/presentation/screens/batch/batch.dart';
import 'package:client/presentation/screens/profile/profileScreen.dart';

import 'package:client/presentation/widgets/layouts/batchesWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    final list = ref.watch(BatchProviders.listBatchesProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
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
              // IconButton(
              //     onPressed: () {},
              //     icon: Icon(
              //       CupertinoIcons.bell_fill,
              //       size: 25,
              //     )),
              // const SizedBox(
              //   width: 10,
              // ),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Handle the tap event here
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Batch()));
                  },
                  child: BatchesWidgets(
                    name: list[index].name,
                    date: list[index].data,
                    time: list[index].time,
                    username: list[index].name,
                  ),
                );
              },
              childCount: list.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10, top: 5),
              child: SizedBox(
                height: 30,
                child: Text(
                  textAlign: TextAlign.center,
                  "Mkcl School © 2024",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddBatchScreen()));
        },
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Center(child: Icon(Icons.add)),
      ),
    );
  }
}
