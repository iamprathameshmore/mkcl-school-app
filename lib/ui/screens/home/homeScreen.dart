// ignore: file_names
import 'package:client/ui/screens/batch/addBatchScreen.dart';
import 'package:client/ui/screens/batch/batch.dart';
import 'package:client/ui/screens/profile/profileScreen.dart';
import 'package:client/ui/widgets/layouts/drawerWidget.dart';
import 'package:client/ui/widgets/layouts/batchesWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        drawer: const HomeDrawer(),
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
                    style: const TextStyle(
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
                        duration: const Duration(milliseconds: 100),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://avatars.githubusercontent.com/u/91453437?v=4'),
                          ),
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle the tap event here
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Batch()));
                      },
                      child: const BatchesWidgets(),
                    );
                  },
                  childCount: 20,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 5),
                  child: SizedBox(
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
            onPressed: () {
              Navigator.of(context).push(_createRoute());
            },
            backgroundColor: Colors.indigo,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: const Center(child: Icon(Icons.add)),
          ),
        ));
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const AddBatchScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
