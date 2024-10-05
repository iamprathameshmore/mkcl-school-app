// ignore: file_names

import 'package:client/data/database/sql_helper.dart';
import 'package:client/presentation/screens/batch/addBatchScreen.dart';
import 'package:client/presentation/screens/batch/batch.dart';
import 'package:client/presentation/screens/profile/profileScreen.dart';

import 'package:client/presentation/widgets/layouts/batchesWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Map<String, dynamic>> alldata = [];
  DataBaseSql? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = DataBaseSql.getInstance;
    getBatches();
  }

  void getBatches() async {
    alldata = await dbRef!.getAllData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
      body: alldata.isNotEmpty
          ? ListView.builder(
              itemCount: alldata.length,
              itemBuilder: (_, index) {
                return BatchesWidgets(
                  title: '${alldata[index][DataBaseSql.COL_TITLE]}',
                  desc: '${alldata[index][DataBaseSql.COL_DES]}',
                  startDate: '${alldata[index][DataBaseSql.COL_START_DATE]}',
                  endDate: '${alldata[index][DataBaseSql.COL_END_DATE]}',
                );
              })
          : const Center(
              child: Text('no batch found please add the batch'),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddBatchScreen()));
          // dbRef!.addBatch(
          //     title: 'batch', desc: 'des', startAt: '01', endAt: '02');
          getBatches();
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
