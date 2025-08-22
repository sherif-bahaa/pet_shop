import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/Firebase/firebase_function.dart';
import 'package:pet_shop/UI/payment_method.dart';
import 'package:pet_shop/UI/payment_success.dart';
import 'package:pet_shop/core/widgets/helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurpleAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("cart ", style: TextStyle(color: Colors.white)),
            SizedBox(width: Helper.responsiveWidth(context, width: 40)),
            Icon(Icons.shopping_cart),
          ],
        ),
      ),

      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('cart').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              final docs = snapshot.data!.docs;
              print(docs);

              return Expanded(
                child: ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    return ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: Image.asset("assets/hom_image.png"),
                      title: Text(data['name'] ?? 'No name'),
                      trailing: IconButton(
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('cart')
                              .doc(data["id"])
                              .delete();
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ),
              );
            },
          ),

          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
              ),
              onPressed: () async {
                bool hascart = await FirebaseFunctions.userHasPaymentCard();
                if (hascart == true) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSuccessPage(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodPage(),
                    ),
                  );
                }
              },
              child: Text("check out  ", style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
