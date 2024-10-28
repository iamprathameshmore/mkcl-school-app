import 'package:client/data/database/sql_helper.dart';
import 'package:client/providers/batch/batch_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class AddBatchScreen extends ConsumerStatefulWidget {
  const AddBatchScreen({super.key});

  @override
  ConsumerState<AddBatchScreen> createState() => _AddBatchScreenState();
}

class _AddBatchScreenState extends ConsumerState<AddBatchScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController studentName = TextEditingController();

  DataBaseSql? dbRef;
  DateTime? pickedStartDate;
  DateTime? pickedEndDate;
  TimeOfDay? pickedStartTime;
  TimeOfDay? pickedEndTime;

  // A list to hold selected weekdays
  List<bool> selectedWeekdays = List.generate(7, (_) => false);

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
      print('Picked file: ${file.name}');
    } else {
      // User canceled the picker
    }
  }

  void showAddStudentDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Student'),
          content: TextField(
            controller: studentName,
            decoration: InputDecoration(hintText: 'Enter student name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Handle adding the student
                print('Added student: ${studentName.text}');
                studentName.clear(); // Clear the input after adding
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final allbatch = ref.read(batchProvider.notifier);
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
                print([
                  title.text,
                  desc.text,
                ]);
                if (title.text.isNotEmpty && desc.text.isNotEmpty) {
                  await allbatch.addBatch(
                      titlenew: title.text,
                      descnew: desc.text,
                      startDatenew:
                          DateFormat('yyyy-MM-dd').format(pickedStartDate!),
                      endDatenew:
                          DateFormat('yyyy-MM-dd').format(pickedEndDate!),
                      startTimenew: pickedStartTime!.format(context),
                      endTimenew: pickedEndTime!.format(context)); // fixed here
                  Navigator.pop(context);
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
              label: 'Title',
              context: context,
            ),
            buildTextField(
              controller: desc,
              label: 'Description',
              maxLines: 3,
              context: context,
            ),
            Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: buildDateTimePicker(
                      icon: Icons.date_range_outlined,
                      label: pickedStartDate == null
                          ? 'Start Date'
                          : DateFormat('yyyy-MM-dd').format(pickedStartDate!),
                    ),
                    onTap: () async {
                      pickedStartDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020, 7, 1),
                        lastDate: DateTime.now(),
                      );

                      if (pickedStartDate != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Selected start date: ${pickedStartDate.toString()}')),
                        );
                        setState(() {});
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    child: buildDateTimePicker(
                      icon: Icons.date_range_outlined,
                      label: pickedEndDate == null
                          ? 'End Date'
                          : DateFormat('yyyy-MM-dd').format(pickedEndDate!),
                    ),
                    onTap: () async {
                      pickedEndDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020, 7, 1),
                        lastDate: DateTime.now(),
                      );

                      if (pickedEndDate != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Selected end date: ${pickedEndDate.toString()}')),
                        );
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: buildDateTimePicker(
                      icon: Icons.access_time,
                      label: pickedStartTime == null
                          ? 'Start Time'
                          : pickedStartTime!.format(context),
                    ),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Selected start time: ${pickedTime.format(context)}'),
                          ),
                        );
                        setState(() {
                          pickedStartTime = pickedTime;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    child: buildDateTimePicker(
                      icon: Icons.access_time,
                      label: pickedEndTime == null
                          ? 'End Time'
                          : pickedEndTime!.format(context),
                    ),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Selected end time: ${pickedTime.format(context)}'),
                          ),
                        );
                        setState(() {
                          pickedEndTime = pickedTime;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(),
            const SizedBox(height: 10),
            // Weekday selection
            Text('Select Weekdays',
                style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary)),
            SizedBox(
              height: 10,
            ),
            Wrap(
              spacing: 8.0,
              children: List.generate(7, (index) {
                return FilterChip(
                  backgroundColor: Colors.grey,
                  label:
                      Text(DateFormat.E().format(DateTime(2021, 1, index + 4))),
                  selected: selectedWeekdays[index],
                  onSelected: (bool selected) {
                    setState(() {
                      selectedWeekdays[index] = selected;
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build TextFormFields
  Padding buildTextField({
    required BuildContext context,
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.onSurface,
          filled: true,
          labelText: label,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w400,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  // Helper method to build date and time pickers
  Widget buildDateTimePicker({
    required IconData icon,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 50,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
