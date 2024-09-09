import 'package:client/presentation/screens/Profile.dart';
import 'package:client/presentation/widgets/drawer.dart';
import 'package:client/presentation/widgets/batches.widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdrop: Container(
          // width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              shape: BoxShape.rectangle),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOutCubicEmphasized,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,

        // rtlOpening: true,
        openScale: 1.0,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(0)),
        ),
        drawer: HomeDrawer(),
        child: Scaffold(
          // appBar: AppBar(

          // ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                elevation: 0.5,
                shadowColor: Theme.of(context).colorScheme.onSurface,
                backgroundColor: Theme.of(context).colorScheme.surface,
                surfaceTintColor: Theme.of(context).colorScheme.surface,
                foregroundColor: Colors.grey.shade700,
                title: Text.rich(TextSpan(
                    text: 'Mkcl',
                    style: TextStyle(
                        color: Colors.indigo, fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text: ' School',
                          style: TextStyle(color: Colors.grey.shade700))
                    ])),
                centerTitle: true,
                leading: IconButton(
                  onPressed: _handleMenuButtonPressed,
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 100),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                ),
                actions: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://avatars.githubusercontent.com/u/91453437?v=4'),
                          ),
                        ),
                      )),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              // SliverToBoxAdapter(
              //   child: Container(
              //     // color: Colors.amber,
              //     height: MediaQuery.of(context).size.height,
              //     child: ListWheelScrollView(
              //       diameterRatio: 10,
              //       // renderChildrenOutsideViewport: true,
              //       magnification: 1,
              //       useMagnifier: true,
              //       scrollBehavior: ScrollBehavior(),
              //       itemExtent: 200,
              //       children: List.generate(50, (index) {
              //         return Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Container(
              //             color: Colors.amber,
              //             child: ListTile(
              //               title: Center(child: Text('Item $index')),
              //             ),
              //           ),
              //         );
              //       }),
              //     ),
              //   ),
              // ),
              // Expanded(
              //     child: ListWheelScrollView(itemExtent: 200, children: [
              //   Container(
              //     height: 50,
              //     width: double.infinity,
              //     child: Text('hello'),
              //   )
              // ]))

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return BatchesWidgets();
                  },
                  childCount: 20,
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 5),
                  child: Container(
                    height: 30,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Mkcl School © 2024",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Center(child: Icon(Icons.add)),
            backgroundColor: Colors.indigo,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ));
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
