import 'package:client/presentation/screens/batch/batchHomeScreen.dart';
import 'package:client/presentation/screens/batch/students.dart';
import 'package:flutter/material.dart';

class Batch extends StatefulWidget {
  final item;
  const Batch({super.key, this.item});

  @override
  _BatchState createState() => _BatchState();
}

class _BatchState extends State<Batch> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.item;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
        title: Text(
          data['title'],
          style: const TextStyle(
              color: Colors.indigo, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          // unselectedLabelStyle: ,
          dividerHeight: 0,
          indicatorColor: Colors.indigo.shade500,
          labelColor: Colors.indigo.shade500,
          unselectedLabelColor: Colors.grey,
          // indicator: BoxDecoration(
          //     color: Colors.amber, borderRadius: BorderRadius.circular(50)),
          tabs: const [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Home'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Students'),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [BatchHomeScreen(), StudentsScreen()],
      ),
    );
  }
}
