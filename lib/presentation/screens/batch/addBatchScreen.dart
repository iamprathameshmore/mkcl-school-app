// import 'package:client/data/database/sql_helper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class AddBatchScreen extends StatefulWidget {
//   const AddBatchScreen({super.key});

//   @override
//   State<AddBatchScreen> createState() => _AddBatchScreenState();
// }

// class _AddBatchScreenState extends State<AddBatchScreen> {
//   TextEditingController title = TextEditingController();
//   TextEditingController desc = TextEditingController();
//   TextEditingController startAt = TextEditingController();
//   TextEditingController endAt = TextEditingController();

//   DataBaseSql? dbRef;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     dbRef = DataBaseSql.getInstance;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Add New Batch',
//           style: TextStyle(
//               color: Colors.indigo.shade500, fontWeight: FontWeight.w500),
//         ),
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(
//               CupertinoIcons.xmark,
//               color: Colors.grey,
//             )),
//         actions: [
//           IconButton(
//               onPressed: () async {
//                 print(title.text);
//                 if (title.text.isNotEmpty && desc.text.isNotEmpty) {
//                   final check = await dbRef!.addBatch(
//                       title: title.text,
//                       desc: desc.text,
//                       startAt: startAt.text,
//                       endAt: endAt.text);
//                   if (check) {
//                     setState(() {});
//                     Navigator.pop(context);
//                   } else {
//                     ScaffoldMessenger.of(context)
//                         .showSnackBar(SnackBar(content: Text('No data Add')));
//                   }
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('All Fileds must be added')));
//                 }
//               },
//               icon: const Icon(
//                 Icons.done,
//                 color: Colors.grey,
//               )),
//           const SizedBox(
//             width: 5,
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Column(
//             children: [
//               const Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//                     child: Text(
//                       "Name Of Batch",
//                       style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: title,
//                   style:
//                       TextStyle(color: Theme.of(context).colorScheme.primary),
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(

//                       // focusColor: Colors.amber,
//                       fillColor: Theme.of(context).colorScheme.onSurface,
//                       filled: true,
//                       labelText: 'Batch title',
//                       labelStyle: TextStyle(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.w400),
//                       prefixIcon: Icon(
//                         Icons.title_outlined,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                       enabled: true,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.onSurface),
//                           borderRadius: BorderRadius.circular(5)),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.onSurface),
//                           borderRadius: BorderRadius.circular(5))),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               const Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//                     child: Text(
//                       "Description",
//                       style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: desc,
//                   style:
//                       TextStyle(color: Theme.of(context).colorScheme.primary),
//                   keyboardType: TextInputType.multiline,
//                   maxLines: null, // <-- SEE HERE
//                   decoration: InputDecoration(

//                       // focusColor: Colors.amber,
//                       fillColor: Theme.of(context).colorScheme.onSurface,
//                       filled: true,
//                       labelText: 'Description',
//                       labelStyle: TextStyle(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.w400),
//                       prefixIcon: Icon(
//                         Icons.description_outlined,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                       enabled: true,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.onSurface),
//                           borderRadius: BorderRadius.circular(5)),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.onSurface),
//                           borderRadius: BorderRadius.circular(5))),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               const Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//                     child: Text(
//                       "Start Date",
//                       style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: startAt,
//                   style:
//                       TextStyle(color: Theme.of(context).colorScheme.primary),
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(

//                       // focusColor: Colors.amber,
//                       fillColor: Theme.of(context).colorScheme.onSurface,
//                       filled: true,
//                       labelText: 'Start Date',
//                       labelStyle: TextStyle(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.w400),
//                       prefixIcon: Icon(
//                         Icons.date_range_outlined,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                       enabled: true,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.onSurface),
//                           borderRadius: BorderRadius.circular(5)),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.onSurface),
//                           borderRadius: BorderRadius.circular(5))),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               const Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//                     child: Text(
//                       "End Date",
//                       style: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextFormField(
//                   controller: endAt,
//                   style:
//                       TextStyle(color: Theme.of(context).colorScheme.primary),
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(

//                       // focusColor: Colors.amber,
//                       fillColor: Theme.of(context).colorScheme.onSurface,
//                       filled: true,
//                       labelText: 'End Date',
//                       labelStyle: TextStyle(
//                           color: Theme.of(context).colorScheme.primary,
//                           fontWeight: FontWeight.w400),
//                       prefixIcon: Icon(
//                         Icons.date_range_outlined,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                       enabled: true,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.onSurface),
//                           borderRadius: BorderRadius.circular(5)),
//                       enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Theme.of(context).colorScheme.onSurface),
//                           borderRadius: BorderRadius.circular(5))),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:client/data/database/sql_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddBatchScreen extends StatefulWidget {
  const AddBatchScreen({super.key});

  @override
  State<AddBatchScreen> createState() => _AddBatchScreenState();
}

class _AddBatchScreenState extends State<AddBatchScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController startAt = TextEditingController();
  TextEditingController endAt = TextEditingController();
  TextEditingController startTime = TextEditingController();
  TextEditingController endTime = TextEditingController();

  DataBaseSql? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = DataBaseSql.getInstance;
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'xlsx'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      // Handle the selected file (upload or read the content)
      print('Picked file: ${file.name}');
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add New Batch',
          style: TextStyle(
              color: Colors.indigo.shade500, fontWeight: FontWeight.w500),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.xmark,
              color: Colors.grey,
            )),
        actions: [
          IconButton(
              onPressed: () async {
                if (title.text.isNotEmpty &&
                    desc.text.isNotEmpty &&
                    startAt.text.isNotEmpty &&
                    endAt.text.isNotEmpty &&
                    startTime.text.isNotEmpty &&
                    endTime.text.isNotEmpty) {
                  final check = await dbRef!.addBatch(
                      title: title.text,
                      desc: desc.text,
                      startAt: startAt.text,
                      endAt: endAt.text);
                  if (check) {
                    setState(() {});
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('No data added')));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('All fields must be filled')));
                }
              },
              icon: const Icon(
                Icons.done,
                color: Colors.grey,
              )),
          const SizedBox(width: 5),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            buildTextField(
              controller: title,
              label: 'Batch Title',
              icon: Icons.title_outlined,
            ),
            buildTextField(
              controller: desc,
              label: 'Description',
              icon: Icons.description_outlined,
              maxLines: 3,
            ),
            buildTextField(
              controller: startAt,
              label: 'Start Date',
              icon: Icons.date_range_outlined,
            ),
            buildTextField(
              controller: endAt,
              label: 'End Date',
              icon: Icons.date_range_outlined,
            ),
            buildTextField(
              controller: startTime,
              label: 'Start Time',
              icon: Icons.access_time,
            ),
            buildTextField(
              controller: endTime,
              label: 'End Time',
              icon: Icons.access_time,
            ),
            const SizedBox(height: 20),
            // Button to upload CSV/Excel
            GestureDetector(
                onTap: pickFile,
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_file,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Upload CSV/Excel',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // Helper method to build TextFormFields
  Padding buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        maxLines: null,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.onSurface,
          filled: true,
          labelText: label,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
