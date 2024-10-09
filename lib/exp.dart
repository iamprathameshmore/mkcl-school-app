import 'package:flutter/material.dart';

class ScrollableStudentListScreen extends StatelessWidget {
  const ScrollableStudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of students
    final List<String> students =
        List.generate(50, (index) => 'Student ${index + 1}');

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Student List'),
          ),
          // Top Component (e.g., a header)
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Welcome to the Student List',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Total Students: 100', style: TextStyle(fontSize: 20)),
                  Text('Total Batches: 10', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ),

          // Scrollable List of Students
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    title: Text(students[index]),
                    onTap: () {
                      // Handle student tap
                    },
                  ),
                );
              },
              childCount: students.length,
            ),
          ),

          // Bottom Component (e.g., a footer)
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey.shade300,
              padding: const EdgeInsets.all(16.0),
              child: const Center(
                child: Text('Mkcl School © 2024',
                    style: TextStyle(color: Colors.grey)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
