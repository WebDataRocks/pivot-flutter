import 'package:flutter/material.dart';
import 'package:pivot_flutter/examples/PivotTableDemo.dart';
import 'package:pivot_flutter/examples/UsingApiCalls.dart';
import 'package:pivot_flutter/examples/UsingEvents.dart';

class TabNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Builder(builder: (BuildContext context) {
            final TabController controller = DefaultTabController.of(context)!;
            controller.addListener(() {
              if (!controller.indexIsChanging) {
                print(controller.index);
                // add code to be executed on TabBar change
              }
            });
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 5, 152, 223),
                foregroundColor: Color.fromARGB(255, 233, 233, 233),
                title: const Text('Flutter Flexmonster'),
                bottom: const TabBar(
                  indicatorColor: Color.fromARGB(255, 233, 233, 233),
                  tabs: [
                    Tab(text: "Pivot Table Demo"),
                    Tab(text: "Using API Calls"),
                    Tab(text: "Using Events"),
                  ],
                ),
              ),
              body: const TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Center(child: PivotTableDemo()),
                  Center(child: UsingApiCalls()),
                  Center(child: UsingEvents()),
                ],
              ),
            );
          })),
    );
  }
}
