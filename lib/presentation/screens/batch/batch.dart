import 'package:client/presentation/screens/batch/AttendanceScreen.dart';
import 'package:client/presentation/widgets/layouts/personListWidget.dart';
import 'package:flutter/material.dart';

class Batch extends StatefulWidget {
  const Batch({super.key});

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
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
        title: const Text(
          'Batch Name',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w500),
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
        children: [
          const Center(child: Text('Content of Tab 1')),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return const Personlistwidget();
                        })),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigo.shade500,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onPressed: () {
          // Action when button is pressed
          Navigator.of(context).push(_createRoute());
          print("FAB Pressed");
        },
        label: Text(
          'Start Attendance',
          style: TextStyle(color: Theme.of(context).colorScheme.surface),
        ),
        icon:
            Icon(Icons.done_all, color: Theme.of(context).colorScheme.surface),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const AttendanceScreen(),
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
