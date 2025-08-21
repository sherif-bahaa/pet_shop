import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pet_shop/models/payment_model.dart';
import 'package:pet_shop/models/pet.dart';
import 'package:pet_shop/models/user_model.dart';

class FirebaseFunctions {
  /// Sign In
  static Future<void> createAccount({
    required String email,
    required String password,
    required Function onSucess,
    required Function onError,
    required String name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        userId: credential.user!.uid,
        email: email,
        name: name,
        password: password,
      );

      await addUser(user);
      onSucess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    } catch (e) {
      onError(e.toString());
    }
  }

  /// Log In
  static Future<void> logIn({
    required String email,
    required String password,
    required Function onSucess,
    required Function onError,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      onSucess();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
    }
  }

  /// Log Out
  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  /// User Model
  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) {
            return UserModel.fromJson(snapshot.data()!);
          },
          toFirestore: (user, _) {
            return user.toJson();
          },
        );
  }

  static Future<void> addUser(UserModel user) {
    var collection = getUsersCollection();
    var docRef = collection.doc(user.userId);
    return docRef.set(user);
  }

  static Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
    required Function onSuccess,
    required Function(String error) onError,
  }) async {
    try {
      User user = FirebaseAuth.instance.currentUser!;

      AuthCredential credential = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );

      await user.reauthenticateWithCredential(credential);

      await user.updatePassword(newPassword);

      var collection = getUsersCollection();
      await collection.doc(user.uid).update({"password": newPassword});

      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError(e.message ?? "Failed to update password.");
    } catch (e) {
      onError(e.toString());
    }
  }

  static Future<UserModel?> getUserData() async {
    var collection = getUsersCollection();
    DocumentSnapshot<UserModel> userDoc = await collection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return userDoc.data();
  }

  static CollectionReference<PaymentModel> getPaymentsCollection() {
    return FirebaseFirestore.instance
        .collection("Payments")
        .withConverter<PaymentModel>(
          fromFirestore: (snapshot, _) {
            return PaymentModel.fromJson(snapshot.data()!, snapshot.id);
          },
          toFirestore: (payment, _) {
            return payment.toJson();
          },
        );
  }

  static Future<void> addPaymentCard({
    required String cardNumber,
    required String expiry,
    required String cardHolder,
    required String cvv,
  }) async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    var collection = getPaymentsCollection();

    await collection.add(
      PaymentModel(
        cardId: "",
        userId: userId,
        cardNumber: cardNumber,
        expiry: expiry,
        cardHolder: cardHolder,
        cvv: cvv,
      ),
    );
  }

  /// Google Sign-In
  // static Future<void> signInWithGoogle({
  //   required Function onSuccess,
  //   required Function onError,
  // }) async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     if (googleUser == null) {
  //       onError("Google sign-in canceled");
  //       return;
  //     }

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     final userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);

  //     UserModel user = UserModel(
  //       userId: userCredential.user!.uid,
  //       email: userCredential.user!.email ?? "",
  //       name: userCredential.user!.displayName ?? "",
  //       password: "",
  //     );

  //     await addUser(user);

  //     onSuccess();
  //   } catch (e) {
  //     onError(e.toString());
  //   }
  // }

  // static Future<List<PaymentModel>> getUserCards() async {
  //   var userId = FirebaseAuth.instance.currentUser!.uid;
  //   var collection = getPaymentsCollection();
  //
  //   var querySnapshot =
  //       await collection.where("userId", isEqualTo: userId).get();
  //
  //   return querySnapshot.docs.map((doc) => doc.data()).toList();
  // }

  // إضافة منتج إلى السلة

  static Future<bool> addToCart(Pet pet) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final String _collectionName = 'cart';
    var userId = FirebaseAuth.instance.currentUser!.uid;

    // أنشئ docRef يدويًا
    final docRef = _firestore.collection(_collectionName).doc();
    String docId = docRef.id;

    try {
      pet = Pet(
        id: docId,
        userId: userId,
        category: pet.category,
        name: pet.name,
        photoUrls: pet.photoUrls,
        tags: pet.tags,
        status: pet.status,
      );

      // استخدم set بدلاً من add
      await docRef.set(pet.toJson());

      print("تم إضافة المنتج إلى السلة بنجاح");
      return true;
    } catch (e) {
      print("خطأ في إضافة المنتج: $e");
      return false;
    }
  }

  //////////////////////////
  static Future<bool> userHasPaymentCard() async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    var collection = getPaymentsCollection();

    var querySnapshot = await collection
        .where("userId", isEqualTo: userId)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }
}
