import 'package:flutter/material.dart';
import 'package:kpn_pos_application/ui/home/order_on_hold.dart';
import 'package:kpn_pos_application/ui/home/orders_section.dart';
import 'package:kpn_pos_application/ui/home/register_section.dart';
import 'package:kpn_pos_application/vm/home_vm.dart';

class HomePage extends StatefulWidget {
  final HomeViewModel homeViewModel;

  const HomePage({super.key, required this.homeViewModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedButton = 2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    backgroundColor: _selectedButton == 1
                        ? Colors.white
                        : Colors.grey.shade100,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedButton = 1;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'Register',
                        style: TextStyle(color: Colors.black),
                      ),
                      _selectedButton == 1
                          ? Container(
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 8,
                              height: 8,
                            )
                          : Container()
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    backgroundColor: _selectedButton == 2
                        ? Colors.white
                        : Colors.grey.shade100,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedButton = 2;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'Order',
                        style: TextStyle(color: Colors.black),
                      ),
                      _selectedButton == 2
                          ? Container(
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 8,
                              height: 8,
                            )
                          : Container()
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    backgroundColor: _selectedButton == 3
                        ? Colors.white
                        : Colors.grey.shade100,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedButton = 3;
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        'Orders on hold',
                        style: TextStyle(color: Colors.black),
                      ),
                      _selectedButton == 3
                          ? Container(
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: 8,
                              height: 8,
                            )
                          : Container()
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Spacer(),
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Employee Name | Andheri East',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.wifi,
                        color: Colors.green,
                        size: 10,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'ONLINE',
                        style: TextStyle(color: Colors.green, fontSize: 11),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Counter 12',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        toolbarHeight: kToolbarHeight,
      ),
      body: Center(
        child: _selectedButton == 1
            ? RegisterSection()
            : _selectedButton == 2
                ? OrdersSection()
                : _selectedButton == 3
                    ? OrderOnHold()
                    : Container(),
      ),
    );
  }
}
