import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final bool isOnline;

  CustomAppBar({required this.tabController, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              controller: tabController,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Register'),
                      SizedBox(width: 4),
                      Icon(Icons.circle, size: 8, color: Colors.green),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Order'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Orders on Hold'),
                ),
              ],
              indicatorColor: Colors.transparent,
            ),
          ),
          Flexible(
            child: Spacer(
              flex: 1,
            ),
          ),
          Row(
            children: [
              Text("Welcome!"),
              SizedBox(width: 10),
              Text(
                isOnline ? "Online" : "Offline",
                style: TextStyle(
                  color: isOnline ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 48.0);
}
