import 'package:client/data/model/batchModel.dart';
import 'package:client/presentation/screens/batch/addBatchScreen.dart';
import 'package:client/presentation/screens/batch/home/info/batchHomeScreen.dart';
import 'package:client/presentation/screens/batch/home/students/students.dart';
import 'package:flutter/material.dart';

class Batch extends StatefulWidget {
  final BatchModel item; // Replace with your actual model class

  Batch({super.key, required this.item});

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
    final data = widget.item; // Directly access the item
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
        title: Text(
          data.title, // Access the title directly
          style: const TextStyle(
              color: Colors.indigo, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          dividerHeight: 0,
          indicatorColor: Colors.indigo.shade500,
          labelColor: Colors.indigo.shade500,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  SizedBox(width: 10),
                  Text('Home'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.school),
                  SizedBox(width: 10),
                  Text('Students'),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddBatchScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.edit_outlined)),
          const SizedBox(width: 5),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BatchHomeScreen(
            item: data, // Pass the batch data to BatchHomeScreen
          ),
          StudentsScreen(
            id: int.parse('${data.sNo}'), // Assuming data has an id field
          ),
        ],
      ),
    );
  }
}
