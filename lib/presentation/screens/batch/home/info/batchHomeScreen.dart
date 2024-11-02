import 'package:client/data/model/batchModel.dart';
import 'package:client/presentation/screens/batch/home/info/attendance/AttendanceScreen.dart';
import 'package:flutter/material.dart';

class BatchHomeScreen extends StatefulWidget {
  final BatchModel item;
  const BatchHomeScreen({
    super.key,
    required this.item,
  });

  @override
  State<BatchHomeScreen> createState() => _BatchHomeScreenState();
}

class _BatchHomeScreenState extends State<BatchHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final data = widget.item;
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: Theme.of(context).colorScheme.onSurface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Title",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Text(
                          data.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildInfoBlock(
                icon: Icons.date_range,
                label: "Start Date",
                value: data.startTime,
              ),
              const SizedBox(height: 10),
              _buildInfoBlock(
                icon: Icons.date_range,
                label: "End Date",
                value: data.endDate,
              ),
              const SizedBox(height: 10),
              _buildInfoBlock(
                icon: Icons.access_time,
                label: "Start Time",
                value: data.startTime,
              ),
              const SizedBox(height: 10),
              _buildInfoBlock(
                icon: Icons.access_time,
                label: "End Time",
                value: data.endTime,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        backgroundColor: Colors.indigo.shade500,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        label: const Text(
          'Start Attendance',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.done_all, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildInfoBlock({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Card(
      color: Theme.of(context).colorScheme.onSurface,
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(
                icon,
                color: Colors.indigo.shade700,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Route _createRoute() {
    final data = widget.item;

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          AttendanceScreen(id: int.parse('${data.sNo}')),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
