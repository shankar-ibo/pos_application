import 'package:flutter/material.dart';
import 'package:kpn_pos_application/utils/dash_line.dart';

class KeypadScreen extends StatefulWidget {
  @override
  _KeypadScreenState createState() => _KeypadScreenState();
}

class _KeypadScreenState extends State<KeypadScreen> {
  String input = '';

  void _onKeyPressed(String value) {
    setState(() {
      input += value;
    });
  }

  void _onClear() {
    setState(() {
      input = input.substring(0, input.length - 1);
    });
  }

  void _onClearAll() {
    setState(() {
      input = '';
    });
  }

  void _onBackspace() {
    setState(() {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    });
  }

  void _onEnter() {
    print('Entered number: $input');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
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
                  // borderRadius: BorderRadius.circular(
                  //     10),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: DashedLine(
                        height: 0.4,
                        dashWidth: 4,
                        color: Colors.grey,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                controller: TextEditingController(text: input),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  focusColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .grey.shade300, // Normal border color
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey
                                          .shade300, // Focused border color
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
                                      color: Colors
                                          .red, // Focused error border color
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
                                          text: ' Enter Code, Quantity ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // TextField(
                              //   decoration: InputDecoration(
                              //     labelText: 'Enter Code, Quantity',
                              //   ),
                              //   readOnly: true,
                              //   controller: TextEditingController(text: input),
                              // ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildKeyIcon(
                                    'assets/images/number_7.png', "7"),
                                _buildKeyIcon(
                                    'assets/images/number_8.png', "8"),
                                _buildKeyIcon(
                                    'assets/images/number_9.png', "9"),
                                _buildKeyClear(
                                    'assets/images/number_back.png', "C")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _buildKeyIcon(
                                    'assets/images/number_4.png', "4"),
                                _buildKeyIcon(
                                    'assets/images/number_5.png', "5"),
                                _buildKeyIcon(
                                    'assets/images/number_6.png', "6"),
                                _buildKeyClearAll(
                                    'assets/images/number_clear.png', "CA")
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(children: [
                                  Row(
                                    children: [
                                      _buildKeyIcon(
                                          'assets/images/number_1.png', "1"),
                                      _buildKeyIcon(
                                          'assets/images/number_2.png', "2"),
                                      _buildKeyIcon(
                                          'assets/images/number_3.png', "3"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      _buildKeyDot(
                                          'assets/images/number_dot.png', "."),
                                      _buildKeyIcon(
                                          'assets/images/number_0.png', "0"),
                                      _buildKeyIcon(
                                          'assets/images/number_00.png', "00"),
                                    ],
                                  ),
                                ]),
                                _buildKeyEnterIcon(
                                    'assets/images/number_enter.png', "")
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    // borderRadius: BorderRadius.circular(
                    //     10),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Items',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '10',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Total Savings',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '₹88888.88',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            left: 4, right: 4, top: 10, bottom: 4),
                        child: ElevatedButton(
                          onPressed: () {
                            // Respond to button press
                          },
                          child: Column(
                            children: [
                              Text(
                                "Proceed To Pay",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "₹88888.88",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 1,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 20),
                              shape: RoundedRectangleBorder(
                                side: BorderSide.none,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.yellow),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyIcon(String img, String label, {VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed ?? () => _onKeyPressed(label),
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Color(0xFFF0F4F4),
          border: Border.all(color: Color(0xFFF0F4F4)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Image.asset(
            img,
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyClear(String img, String label, {VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed ?? () => _onClear(),
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Color(0xFFF0F4F4),
          border: Border.all(color: Color(0xFFF0F4F4)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Image.asset(
            img,
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyClearAll(String img, String label,
      {VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed ?? () => _onClearAll(),
      child: Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Color(0xFFF0F4F4),
          border: Border.all(color: Color(0xFFF0F4F4)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Image.asset(
            img,
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyDot(String img, String label, {VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed ?? () => _onKeyPressed(label),
      child: Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Color(0xFFF0F4F4),
          border: Border.all(color: Color(0xFFF0F4F4)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            child: Image.asset(
              img,
              height: 10,
              width: 10,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKeyEnterIcon(String img, String label,
      {VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed ?? () => _onKeyPressed(label),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 1),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Color(0xFFF0F4F4),
          border: Border.all(color: Color(0xFFF0F4F4)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15),
            // margin: const EdgeInsets.all(15.0),
            child: Image.asset(
              img,
              height: 30,
              width: 30,
            ),
          ),
        ),
      ),
    );
  }

/*
 Expanded(
            child:
             GridView.count(
              crossAxisCount: 3,
              children: [
                _buildKey1('7'),
                _buildKey('8'),
                _buildKey('9'),
                _buildKey('4'),
                _buildKey('5'),
                _buildKey('6'),
                _buildKey('1'),
                _buildKey('2'),
                _buildKey('3'),
                _buildKey('.'),
                _buildKey('0'),
                _buildKey('00'),
                _buildKey('C', onPressed: _onClear),
                _buildKey('<-', onPressed: _onBackspace),
                _buildKey('Enter', onPressed: _onEnter),
              ],
            ),
          ),
*/
}
