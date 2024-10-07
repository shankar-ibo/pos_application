import 'package:flutter/material.dart';
import 'package:kpn_pos_application/utils/custom_appbar.dart';
import 'package:kpn_pos_application/vm/home_vm.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel homeViewModel;
  const HomePage({super.key, required this.homeViewModel});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Register'),
    Tab(text: 'Orders'),
    Tab(text: 'Orders on hold'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        tabController: _tabController,
        isOnline: true,
      ),
      body: TabBarView(
        // viewportFraction: 1,
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          final String label = tab.text!.toLowerCase();
          return Center(
            child: Text(
              'This is the $label tab',
              style: const TextStyle(fontSize: 36),
            ),
          );
        }).toList(),
      ),
    );
  }
}
