import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderOnHold extends StatefulWidget {
  const OrderOnHold({super.key});

  @override
  State<OrderOnHold> createState() => _OrderOnHoldState();
}

class _OrderOnHoldState extends State<OrderOnHold> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9, // 0.6 ratio
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(),
                  _buildTableView1(),
                ],
              )),
        ),
        Expanded(
          flex: 1, // 0.1 ratio
          child: _buildRightActionButtons(),
        ),
      ],
    );
    ;
  }
}

Widget _buildTitle() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          "Total 12 orders are on hold!",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Resume orders to complete the sale",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

Widget _buildTableView1() {
  return Container(
    padding: EdgeInsets.only(bottom: 2),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        // color: Colors.grey.shade300,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        )),
    child: Column(
      children: [
        Table(
          // border:
          // TableBorder(bottom: BorderSide(), horizontalInside: BorderSide()),
          //  border: TableBorder.symmetric(inside: BorderSide(width: 0.4)), // Optional: to add borders to the table
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(2),
            4: FlexColumnWidth(1),
            5: FlexColumnWidth(2),
            6: FlexColumnWidth(1),
            7: FlexColumnWidth(1),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  )), // Header background color
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Cart Id")),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Reserved Order Id")),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Customer Name")),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Customer Number")),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Cashier")),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Hold Date")),
                Padding(padding: const EdgeInsets.all(10.0), child: Text("")),
                Padding(padding: const EdgeInsets.all(10.0), child: Text("")),
              ],
            ),
          ],
        ),
        Table(
          border:
              TableBorder(verticalInside: BorderSide(color: Color(0xFFCACACA))),

          // border: TableBorder.symmetric(inside: BorderSide(width: 0.4)), // Optional: to add borders to the table
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(2),
            4: FlexColumnWidth(1),
            5: FlexColumnWidth(2),
            6: FlexColumnWidth(1),
            7: FlexColumnWidth(1),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(6.0),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("#11122")),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(6.0),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("#1231313")),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(6.0),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Shankar Lonare")),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(6.0),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("+91 8871722186")),
                ),
                Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(6.0),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Akshay"))),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(6.0),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("18 September 2024")),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 80,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "    Resume    ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 1,
                          padding:
                              EdgeInsets.symmetric(horizontal: 1, vertical: 4),
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Colors.green),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 80,
                    height: 36,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "    Delete    ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 1,
                          padding:
                              EdgeInsets.symmetric(horizontal: 1, vertical: 4),
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildRightActionButtons() {
  return Center(
    child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  _buidButton("Customer"),
                  _buidButton("Search items"),
                  _buidButton("Inventory inquiry"),
                  _buidButton("Coupons"),
                  _buidButton("Sales Associate")
                ],
              ),
            ),
            _buidButton("Hold cart")
          ],
        )),
  );
}

Widget _buidButton(String label) {
  return Container(
    width: 200,
    height: 80,
    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
    child: ElevatedButton(
      onPressed: () {
        // Respond to button press
      },
      child: Center(
        child: Text(
          "$label",
          style: TextStyle(
              color: Color(0xFF066A69),
              fontSize: 14,
              fontWeight: FontWeight.normal),
        ),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 1,
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 20),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF066A69)),
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Color(0xFFF0F4F4),
      ),
    ),
  );
}
