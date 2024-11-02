import 'package:flutter/material.dart';

// class Personlistwidget extends StatelessWidget {
//   final String name;
//   final String data;
//   const Personlistwidget({super.key, required this.name, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.onSurface,
//             borderRadius: BorderRadius.circular(2)),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "name : $name",
//                 style: TextStyle(
//                     color: Theme.of(context).colorScheme.primary, fontSize: 10),
//               ),
//               Text(
//                 "data : $data",
//                 style: const TextStyle(color: Colors.grey, fontSize: 10),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class PersonListWidget extends StatelessWidget {
  final String name;
  final String rollNo;
  final VoidCallback onDelete;

  const PersonListWidget({
    required this.name,
    required this.rollNo,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.onSurface,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          "Roll No: $rollNo",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
