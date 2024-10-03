import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Batchhomescreen extends StatefulWidget {
  const Batchhomescreen({super.key});

  @override
  State<Batchhomescreen> createState() => _BatchhomescreenState();
}

class _BatchhomescreenState extends State<Batchhomescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return TimelineTile(
              afterLineStyle: LineStyle(color: Colors.indigo, thickness: 2),
              beforeLineStyle:
                  LineStyle(color: Colors.indigo.shade600, thickness: 2),
              indicatorStyle: IndicatorStyle(color: Colors.indigo.shade600),
              alignment: TimelineAlign.manual,
              lineXY:
                  0.3, // Adjust this value to shift the timeline line to the left

              startChild: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
                child: Text('Absent :'),
              ),
              endChild: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Present :'),
                      Text('Absent :'),
                    ],
                  )),
            );
          }),
    ));
  }
}
