import 'package:client/data/helpers/batchs_database_helper.dart';
import 'package:client/providers/batch/batch_Provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  BatchDatabaseHelper? dbRef;
  DateTime? pickedStartDate;
  DateTime? pickedEndDate;
  TimeOfDay? pickedStartTime;
  TimeOfDay? pickedEndTime;

  // A list to hold selected weekdays
  List<bool> selectedWeekdays = List.generate(7, (_) => false);

  @override
  void initState() {
    super.initState();
    dbRef = BatchDatabaseHelper();
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
          // IconButton(
          //     onPressed: () async {
          //       print([
          //         title.text,
          //         desc.text,
          //       ]);

          //         try {
          //            print(" start Try here........................... ");
          //           if (title.text.isNotEmpty) {
          //           await allbatch.addBatch(
          //               titlenew: title.text,
          //               startDatenew:
          //                   DateFormat('yyyy-MM-dd').format(pickedStartDate!),
          //               endDatenew:
          //                   DateFormat('yyyy-MM-dd').format(pickedEndDate!),
          //               startTimenew: pickedStartTime!.format(context),
          //               endTimenew: pickedEndTime!.format(context));
          //         }
          //            print(" start Try here........................... ");

          //         }
          //          catch (e) {
          //           print(
          //               '--------------------------------- Start Error --------------------------------');
          //           print(e);
          //           print(
          //               '--------------------------------- End Error --------------------------------');
          //         }

          //         // fixed here
          //         Navigator.pop(context);

          //     },
          //     icon: const Icon(
          //       Icons.done,
          //       color: Colors.grey,
          //     )),
          IconButton(
            onPressed: () async {
              // Print out the title and description for debugging
              print([
                title.text,
                desc.text,
              ]);

              // Check if required fields are filled
              if (title.text.isEmpty ||
                  pickedStartDate == null ||
                  pickedEndDate == null ||
                  pickedStartTime == null ||
                  pickedEndTime == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Please fill in all required fields.')),
                );
                return; // Exit if validation fails
              }

              try {
                print("Start Try here...........................");
                // Proceed to add the batch if validation is successful
                await allbatch.addBatch(
                  titlenew: title.text,
                  startDatenew:
                      DateFormat('yyyy-MM-dd').format(pickedStartDate!),
                  endDatenew: DateFormat('yyyy-MM-dd').format(pickedEndDate!),
                  startTimenew: pickedStartTime!.format(context),
                  endTimenew: pickedEndTime!.format(context),
                );
                print("Batch added successfully.");
                Navigator.pop(context);
              } catch (e) {
                print(
                    '--------------------------------- Start Error --------------------------------');
                print(e);
                print(
                    '--------------------------------- End Error --------------------------------');
                // Optionally show an error message to the user
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('Error adding batch: ${e.toString()}')),
                );
              }

              // Navigate back to the previous screen after adding the batch
            },
            icon: const Icon(
              Icons.done,
              color: Colors.grey,
            ),
          ),

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
            // buildTextField(
            //   controller: desc,
            //   label: 'Description',
            //   maxLines: 3,
            //   context: context,
            // ),

            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text('Select Date And Time',
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ),
            // const Divider(),
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
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: Colors.indigo
                                  .shade600, // Change the color of the header
                              // Change the color of the accent (buttons)
                              colorScheme: ColorScheme.light(
                                  primary: Colors.indigo
                                      .shade600), // Change the color scheme
                              buttonTheme: ButtonThemeData(
                                  textTheme: ButtonTextTheme
                                      .primary), // Change button text color
                            ),
                            child: child ?? Container(),
                          );
                        },
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
                const SizedBox(width: 10),
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
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: Colors.indigo
                                  .shade600, // Change the color of the header
                              // Change the color of the accent (buttons)
                              colorScheme: ColorScheme.light(
                                  primary: Colors.indigo
                                      .shade600), // Change the color scheme
                              buttonTheme: ButtonThemeData(
                                  textTheme: ButtonTextTheme
                                      .primary), // Change button text color
                            ),
                            child: child ?? Container(),
                          );
                        },
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
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: Colors.indigo
                                  .shade600, // Change the color of the header
                              // Change the color of the accent (buttons)
                              colorScheme: ColorScheme.light(
                                  primary: Colors.indigo
                                      .shade600), // Change the color scheme
                              buttonTheme: ButtonThemeData(
                                  textTheme: ButtonTextTheme
                                      .primary), // Change button text color
                            ),
                            child: child ??
                                Container(), // Provide a fallback for child
                          );
                        },
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
                const SizedBox(width: 10),
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
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              primaryColor: Colors.indigo
                                  .shade600, // Change the color of the header
                              // Change the color of the accent (buttons)
                              colorScheme: ColorScheme.light(
                                  primary: Colors.indigo
                                      .shade600), // Change the color scheme
                              buttonTheme: ButtonThemeData(
                                  textTheme: ButtonTextTheme
                                      .primary), // Change button text color
                            ),
                            child: child ??
                                Container(), // Provide a fallback for child
                          );
                        },
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
            // const Divider(),
            const SizedBox(height: 10),
            // Weekday selection
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text('Select Weekdays',
                    style: TextStyle(fontSize: 18, color: Colors.grey)),
              ],
            ),
            const SizedBox(
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
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
      height: 50,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
