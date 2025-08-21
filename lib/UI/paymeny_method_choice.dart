import 'package:flutter/material.dart';
import 'package:pet_shop/widgets/helper.dart';



class PaymentMethodChoicePage extends StatefulWidget {
  const PaymentMethodChoicePage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodChoicePage> createState() =>
      _PaymentMethodChoicePageState();
}

class _PaymentMethodChoicePageState extends State<PaymentMethodChoicePage> {
  String? _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Payment Method",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Helper.getResponsiveHeight(context, height: 10)),

            const Text(
              "Choose your payment Method",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: Helper.getResponsiveHeight(context, height: 30)),

            // PayPal Option
            Container(
              margin: EdgeInsets.only(
                bottom: Helper.getResponsiveHeight(context, height: 20),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedMethod == "PayPal"
                      ? const Color(0xff7140FD)
                      : Colors.grey.shade400,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: RadioListTile<String>(
                value: "PayPal",
                groupValue: _selectedMethod,
                activeColor: Color(0xff7140FD),
                title: Text(
                  "PayPal",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: _selectedMethod == "PayPal"
                        ? const Color(0xff7140FD)
                        : Colors.grey.shade400,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedMethod = value;
                  });
                },
              ),
            ),

            // Bank Transfer Option
            Container(
              margin: EdgeInsets.only(
                  bottom: Helper.getResponsiveHeight(context, height: 20)),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedMethod == "Bank Transfer"
                      ? const Color(0xff7140FD)
                      : Colors.grey.shade400,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: RadioListTile<String>(
                value: "Bank Transfer",
                groupValue: _selectedMethod,
                activeColor: Color(0xff7140FD),
                title: Text(
                  "Bank Transfer",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: _selectedMethod == "Bank Transfer"
                        ? const Color(0xff7140FD)
                        : Colors.grey.shade400,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedMethod = value;
                  });
                },
              ),
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedMethod != null
                    ? const Color(0xff7140FD)
                    : Colors.grey.shade400,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (_selectedMethod == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please choose a payment method"),
                    ),
                  );
                } else {
                  Navigator.pushNamed(context, 'success/');
                }
              },
              child: const Text(
                "Checkout",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
