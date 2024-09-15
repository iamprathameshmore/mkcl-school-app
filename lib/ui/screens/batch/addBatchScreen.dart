import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddBatchScreen extends StatefulWidget {
  const AddBatchScreen({super.key});

  @override
  State<AddBatchScreen> createState() => _AddBatchScreenState();
}

class _AddBatchScreenState extends State<AddBatchScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    print(size);
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
              onPressed: () {},
              icon: const Icon(
                Icons.done,
                color: Colors.grey,
              )),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: Column(
        children: [
          Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      "Name Of Batch",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(

                      // focusColor: Colors.amber,
                      fillColor: Theme.of(context).colorScheme.onSurface,
                      filled: true,
                      labelText: 'Batch Name',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        CupertinoIcons.news,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(

                      // focusColor: Colors.amber,
                      fillColor: Theme.of(context).colorScheme.onSurface,
                      filled: true,
                      labelText: 'Description',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        CupertinoIcons.news,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      "Start Date",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(

                      // focusColor: Colors.amber,
                      fillColor: Theme.of(context).colorScheme.onSurface,
                      filled: true,
                      labelText: 'Description',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        CupertinoIcons.news,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(

                      // focusColor: Colors.amber,
                      fillColor: Theme.of(context).colorScheme.onSurface,
                      filled: true,
                      labelText: 'Description',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w400),
                      prefixIcon: Icon(
                        CupertinoIcons.news,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      enabled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.onSurface),
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.indigo),
                    ),
                    onPressed: () {},
                    child: Container(
                        width: size.width / 2,
                        alignment: Alignment.center,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Add Students',
                            style: TextStyle(color: Colors.white),
                          ),
                        ))),
                // SizedBox(
                //   width: 15,
                // ),
                // TextButton(
                //     style: ButtonStyle(
                //       backgroundColor: WidgetStatePropertyAll(Colors.black12),
                //     ),
                //     onPressed: () {},
                //     child: Container(
                //         width: size.width / 3,
                //         alignment: Alignment.center,
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(vertical: 10),
                //           child: Text('Educatores'),
                //         ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
