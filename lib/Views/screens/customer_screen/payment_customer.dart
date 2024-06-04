import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethod();
}

class _PaymentMethod extends State<PaymentMethod> {
  int type = 1;
  void _handleRadio(Object? e) => setState(() {
        type = e as int;
      });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Payment Method',
          textAlign: TextAlign.center,
        ),
        leading: const BackButton(),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                  width: size.width,
                  height: 40,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: type == 1
                        ? Border.all(width: 1, color: Colors.blue)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Radio(
                          value: 1,
                          groupValue: type,
                          onChanged: _handleRadio,
                          activeColor: Colors.blue,
                        ),
                        Text("PayPal ",
                            style: type == 1
                                ? const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)
                                : const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                      ]),
                    ],
                  ))),
              //////////////////
              const SizedBox(
                height: 15,
              ),
              Container(
                  width: size.width,
                  height: 55,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: type == 2
                        ? Border.all(width: 1, color: Colors.blue)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Radio(
                          value: 2,
                          groupValue: type,
                          onChanged: _handleRadio,
                          activeColor: Colors.blue,
                        ),
                        Text("Credit Card ",
                            style: type == 2
                                ? const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)
                                : const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                      ]),
                    ],
                  ))),

              /////////////////////
              const SizedBox(
                height: 15,
              ),
              Container(
                  width: size.width,
                  height: 55,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    border: type == 3
                        ? Border.all(width: 1, color: Colors.blue)
                        : Border.all(width: 0.3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Radio(
                          value: 3,
                          groupValue: type,
                          onChanged: _handleRadio,
                          activeColor: Colors.blue,
                        ),
                        Text("Cash ",
                            style: type == 3
                                ? const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)
                                : const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                      ]),
                    ],
                  ))),
              const SizedBox(
                height: 80,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "300.5",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        " Confirm Payment ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
