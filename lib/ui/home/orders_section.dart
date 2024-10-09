import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'PdfController.dart';

class OrdersSection extends StatefulWidget {
  const OrdersSection({super.key});

  @override
  State<OrdersSection> createState() => _OrdersSectionState();
}

class _OrdersSectionState extends State<OrdersSection> {
  String _selectedWidget = 'OPEN_REGISTER';
  String? _barcode;
  late bool visible;

  void _onKeyPressed(String value) {
    setState(() {
      _selectedWidget = value;
      print(" Widget Name: $_selectedWidget");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            flex: 7, // 0.6 ratio
            child: Container(
                color: Colors.white,
                child: Center(
                    child: _selectedWidget == 'OPEN_REGISTER'
                        ? _buildRegisterClosed(
                            "ADD_CUSTOMER",
                            onPressed: () => _onKeyPressed("ADD_CUSTOMER"),
                          )
                        : _selectedWidget == 'ADD_CUSTOMER'
                            ? _buildAddCustomer(
                                "START_SALE",
                                onPressed: () => _onKeyPressed("START_SALE"),
                              )
                            : _selectedWidget == 'START_SALE'
                                ? Column(
                                    children: [
                                      _buildOrderdetail(),
                                      _buildTableView()
                                    ],
                                  )
                                : Container())
                //  Center(child: Column(children: [_buildOrderdetail(), _buildTableView()],),),
                // child: Center(child: _buildAddCustomer("START_SALE", onPressed :() => _onKeyPressed("START_SALE"),)),
                ),
          ),
          Expanded(
            flex: 2, // 0.2 ratio
            child: Container(
                // child: Center(child: KeypadScreen()),
                ),
          ),
          Expanded(
            flex: 1, // 0.1 ratio
            child: _buildRightActionButtons(),
          ),
        ],
      ),
    );
  }
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

Widget _buildRegisterClosed(String widgetName, {VoidCallback? onPressed}) {
  final PdfController pdfController = Get.put(PdfController());
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: Text(
            "Register is closed!",
            style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Set an opening float to start the sale",
            style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 150,
          // height: 50,
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          child: ElevatedButton(
            onPressed: onPressed,

            child: Center(
              child: Text(
                "Open register",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 1,
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 20),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFFFFCB44)),
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Color(0xFFFFCB44),
            ),
            //  onPressed: () { pdfController.printPdf();  },
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}

Widget _buildAddCustomer(String widgetName, {VoidCallback? onPressed}) {
  return Container(
    width: 400,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: Text(
            "Add customer details",
            style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Add customer details before starting the sale",
            style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: TextField(
              // controller: TextEditingController(text: input),
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300, // Normal border color
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300, // Focused border color
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red, // Error border color
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red, // Focused error border color
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                label: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' Enter Customer Mobile Number ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: TextField(
              // controller: TextEditingController(text: input),
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300, // Normal border color
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300, // Focused border color
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red, // Error border color
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red, // Focused error border color
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                label: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: ' Customer Name ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Center(
              child: Text(
                "Start Sale",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 1,
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 20),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFFFFCB44)),
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBackgroundColor: Colors.grey,
              backgroundColor: Color(0xFFFFCB44),
            ),
          ),
        ),
        Container(
          // width: 200,
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Center(
              child: Text(
                "Continue Without Customer Number",
                style: TextStyle(
                    color: Color(0xFF066A69),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
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
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Text(
            "Select above if the customer denies his/her number",
            style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    ),
  );
}

Widget _buildTableView() {
  return LayoutBuilder(builder: (context, constraints) {
    final isTabletOrDesktop = constraints.maxWidth > 600;
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DataTable(
            dataRowMinHeight: 48,
            // horizontalMargin: 50,
            border: TableBorder.all(
              style: BorderStyle.none,
              width: 0.2,
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            columnSpacing: isTabletOrDesktop ? 72 : 40,
            headingRowColor: MaterialStateProperty.all(Colors.grey.shade300),
            columns: [
              DataColumn(
                  headingRowAlignment: MainAxisAlignment.start,
                  label: Container(
                    width: 100,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                    child: Text('Item Code'),
                  )),
              DataColumn(
                  label: Container(
                      width: 150,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                      child: Text('Name'))),
              DataColumn(
                  label: Container(
                      width: 120,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                      child: Text('Qty'))),
              DataColumn(
                  label: Container(
                      width: 80,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                      child: Text('MRP'))),
              DataColumn(
                  label: Container(
                      width: 80,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                      child: Text('Price'))),
              DataColumn(
                  label: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                      child: Text('Action'))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Container(
                    width: 100,
                    height: 80,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                    child: Text(
                      '99999999999',
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ))),
                DataCell(Container(
                    width: 150,
                    height: 50,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                    child: Text(
                      'Dawat basmati rice 1kg Dawat basmati rice 1kg',
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ))),
                DataCell(Container(
                  width: 120,
                  height: 50,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color:
                                  Colors.grey.shade300, // Normal border color
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color:
                                  Colors.grey.shade300, // Focused border color
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red, // Error border color
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.red, // Focused error border color
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          hintText: "000.099",
                          suffixText: "KG"),
                    ),
                  ),
                )),
                DataCell(Container(
                    width: 80,
                    height: 120,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                    child: Text(
                      '₹99999',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ))),
                DataCell(Container(
                    width: 80,
                    height: 100,
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
                    child: Text(
                      '₹99999.99',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ))),
                DataCell(Container(
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFE56363),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: ImageIcon(
                      size: 20,
                      color: Color(0xFFE56363),
                      AssetImage('assets/images/ic_remove.png'),
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          // Custom padding

                          // contentPadding: EdgeInsets.all(0),
                          title: '',
                          // Empty title to remove space
                          middleText: '',
                          titlePadding: EdgeInsets.all(0),
                          barrierDismissible: false,
                          backgroundColor: Colors.white,
                          content: _buildRemoveDialog());
                    },
                  ),
                )),
              ]),
            ],
          ),
        ),
      ),
    );
  });
}

Widget _buildRemoveDialog() {
  return Container(
    child: Column(
      children: [
        Container(
          // padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFFF8F8F8),
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
          ),
          //color: Color(0xFFF8F8F8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                  ),
                  child: Image.asset(
                    'assets/images/sweet_corn.webp',
                    // height: 80,
                    // width: 80,
                    cacheHeight: 50,
                    cacheWidth: 50,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Alphonso Mango',
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Qty:  ',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: '1',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Price:  ',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          TextSpan(
                            text: '₹1200',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Are you sure you want to remove this item?",
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 4, right: 4, top: 10, bottom: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "    Yes, Remove    ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        padding:
                            EdgeInsets.symmetric(horizontal: 1, vertical: 20),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.green),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 4, right: 4, top: 10, bottom: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "    No, Cancel    ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        padding:
                            EdgeInsets.symmetric(horizontal: 1, vertical: 20),
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
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

Widget _buildOrderdetail() {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order -',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Wednesday, 18 September 2024',
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
            Spacer(),
            Container(
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Customer: - ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextSpan(
                              text: 'Shankar Lonare',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Wallet balance: - ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextSpan(
                              text: '₹12000',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Contact No.: - ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextSpan(
                              text: '+918871722186',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Loyalty Points: - ',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                            TextSpan(
                              text: '2000',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

/*
  Container(
                              width: 200,
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 5), // Adjust the value as needed
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  backgroundColor: Colors.teal.shade50,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Customer',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 5), // Adjust the value as needed
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  backgroundColor: Colors.teal.shade50,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Search items',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 5), // Adjust the value as needed
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  backgroundColor: Colors.teal.shade50,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Inventory Inquiry',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 5), // Adjust the value as needed
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  backgroundColor: Colors.teal.shade50,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Coupons',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 5), // Adjust the value as needed
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  backgroundColor: Colors.teal.shade50,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Sales Associate',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                            ),
                         
*/
