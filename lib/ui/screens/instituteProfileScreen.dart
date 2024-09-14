import 'package:flutter/material.dart';
import '../widgets/batchesWidget.dart';

class InstituteProfileScreen extends StatefulWidget {
  const InstituteProfileScreen({super.key});

  @override
  State<InstituteProfileScreen> createState() => _InstituteProfileScreenState();
}

class _InstituteProfileScreenState extends State<InstituteProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
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
          foregroundColor: Colors.grey.shade700,
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          title: Text(
            "Institute",
            style: TextStyle(
                color: Colors.grey.shade700, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          actions: const [
            SizedBox(
              width: 7,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Stack(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(0.0),
              //       child: Container(
              //         height: 140,
              //         width: double.infinity,
              //         decoration: const BoxDecoration(
              //             // color: Colors.amber,
              //             border: Border(
              //                 bottom:
              //                     BorderSide(width: 1, color: Colors.grey))),
              //         child: Image.network(
              //             fit: BoxFit.cover,
              //             'https://random.imagecdn.app/500/150'),
              //       ),
              //     ),

              //   ],
              // ),
              Container(
                height: 130,
                // width: double.infinity,
                alignment: Alignment.bottomLeft,
                // color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 110,
                    width: 110,
                    decoration: const BoxDecoration(),
                    child: Image.network(
                        'https://avatars.githubusercontent.com/u/91453437?v=4'),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          'Iamprathameshmore',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'Mkcl • hello • 4213',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 5),
                child: Container(
                  child: Text(
                    'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.',
                    style: TextStyle(
                        // fontSize: 15,
                        // fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),

              // TabBar inside a Container
              Container(
                // color: Colors.blue,
                padding:
                    const EdgeInsets.only(top: 20), // Adjust padding as needed
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.indigo.shade600,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.indigo.shade500,
                  dividerColor: Colors.transparent,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: [
                    Tab(
                      child: Container(
                        width: 50,
                        alignment: Alignment.center,
                        child: const Text("About"),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 50,
                        alignment: Alignment.center,
                        child: const Text("About"),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 50,
                        alignment: Alignment.center,
                        child: const Text("About"),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 50,
                        alignment: Alignment.center,
                        child: const Text("About"),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 50,
                        alignment: Alignment.center,
                        child: const Text("About"),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: 50,
                        alignment: Alignment.center,
                        child: const Text("About"),
                      ),
                    ),
                  ],
                ),
              ),

              // Sized Box to prevent the infinite height issue
              SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height, // Fixes the height of TabBarView
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    BatchesWidgets(),
                    Center(child: Text("Content for Tab 2")),
                    Center(child: Text("Content for Tab 3")),
                    Center(child: Text("Content for Tab 4")),
                    Center(child: Text("Content for Tab 5")),
                    Center(child: Text("Content for Tab 6")),
                  ],
                ),
              ),

              // Any widget below the TabBarView
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'This is some content below the TabBarView',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ));
  }
}
