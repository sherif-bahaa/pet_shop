import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_shop/Firebase/firebase_function.dart';
import 'package:pet_shop/widgets/helper.dart';



class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _cardName = TextEditingController();
  final TextEditingController _expiry = TextEditingController();
  final TextEditingController _cvv = TextEditingController();

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add New Payment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
               SizedBox(height: Helper.getResponsiveHeight(context, height: 22)),

              TextFormField(
                controller: _cardNumber,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(16),
                  _CardNumberInputFormatter(),
                ],
                decoration: _inputDecoration("Card Number"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required Field";
                  }
                  if (value.replaceAll(" ", "").length != 16) {
                    return "Card number must be 16 digits";
                  }
                  return null;
                },
              ),
              SizedBox(height: Helper.getResponsiveHeight(context, height: 22)),

              TextFormField(
                controller: _cardName,
                decoration: _inputDecoration("Card Name"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Required Field" : null,
              ),
              SizedBox(height: Helper.getResponsiveHeight(context, height: 22)),

              TextFormField(
                controller: _expiry,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                  _ExpiryDateInputFormatter(),
                ],
                decoration: _inputDecoration("Expired (MM/YY)"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required Field";
                  }
                  if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(value)) {
                    return "Invalid format (MM/YY)";
                  }
                  return null;
                },
              ),
              SizedBox(height: Helper.getResponsiveHeight(context, height: 22)),

              // CVV
              TextFormField(
                controller: _cvv,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                decoration: _inputDecoration("CVV"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required Field";
                  }
                  if (value.length != 3) {
                    return "CVV must be 3 digits";
                  }
                  return null;
                },
              ),

              const Spacer(),

              // Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff7140FD),
                    padding: EdgeInsets.symmetric(vertical: Helper.getResponsiveWidth(context, width: 18)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseFunctions.addPaymentCard(
                        cvv: _cvv.text,
                        cardNumber: _cardNumber.text,
                        expiry: _expiry.text,
                        cardHolder: _cardName.text,
                      );
                      Navigator.pushNamed(context, 'choice/');
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xff7140FD), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}

class _CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digits = newValue.text.replaceAll(' ', '');
    String newString = '';
    for (int i = 0; i < digits.length; i++) {
      if (i % 4 == 0 && i != 0) newString += ' ';
      newString += digits[i];
    }
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}

class _ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digits = newValue.text.replaceAll('/', '');
    String newString = '';
    for (int i = 0; i < digits.length; i++) {
      if (i == 2) newString += '/';
      newString += digits[i];
    }
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}
