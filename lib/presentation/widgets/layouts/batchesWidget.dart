// import 'package:flutter/material.dart';

// class BatchesWidgets extends StatelessWidget {
//   final name;
//   final username;
//   final date;
//   final time;
//   const BatchesWidgets(
//       {super.key, this.name, this.username, this.date, this.time});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//       child: Container(
//           height: 100,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             border: Border.all(
//                 width: 1, color: Theme.of(context).colorScheme.surface),
//             color: Theme.of(context).colorScheme.onSurface,
//           ),
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         name,
//                         style: TextStyle(
//                             color: Theme.of(context).colorScheme.primary),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         username,
//                         style: TextStyle(
//                             color: Theme.of(context).colorScheme.primary),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         '$date - $time',
//                         style: TextStyle(
//                             color: Theme.of(context).colorScheme.primary),
//                       ),
//                     ),
//                   ],
//                 )
//               ])),
//     );
//   }
// }
import 'package:flutter/material.dart';

class BatchesWidgets extends StatelessWidget {
  final String? name;
  final String? username;
  final String? title;
  final String? desc;
  final String? startDate;
  final String? endDate;
  final String? startTime;
  final String? endTime;

  const BatchesWidgets({
    super.key,
    this.name,
    this.username,
    this.title,
    this.desc,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
      child: Card(
        elevation: 1,
        color: Theme.of(context).colorScheme.onSurface,
        shadowColor: Colors.grey.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? 'No Title',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Description
              Text(
                desc ?? 'No description available.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 10),

              // Date and Time Information
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start: $startDate - $startTime',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'End: $endDate - $endTime',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // More options or actions
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    print("start Attendance");
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    backgroundColor: Colors.indigo.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Start Attendance',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
