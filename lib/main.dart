import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop/UI/forget_screen1.dart';
import 'package:pet_shop/UI/login.dart';
import 'package:pet_shop/UI/onboarding.dart';
import 'package:pet_shop/UI/payment_method.dart';
import 'package:pet_shop/UI/payment_success.dart';
import 'package:pet_shop/UI/paymeny_method_choice.dart';
import 'package:pet_shop/UI/reset_password2.dart';
import 'package:pet_shop/UI/singup.dart';
import 'package:pet_shop/firebase_options.dart';
import 'package:pet_shop/providers/login_provider.dart';
import 'package:pet_shop/screens/cart_page.dart';
import 'package:pet_shop/screens/home.dart';
import 'package:provider/provider.dart';
import 'providers/pet_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PetProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
      ],

      child: MaterialApp(
        routes: {
          'login/': (context) => const LogIn(),
          'cartpage/': (context) => const CartPage(),
          'createAccount/': (context) => const CreateAccount(),
          'choice/': (context) => const PaymentMethodChoicePage(),
          'payment/': (context) => const PaymentMethodPage(),
          'success/': (context) => const PaymentSuccessPage(),
          'home/': (context) => HomePageState(),
          'resetPass/': (context) => const ResetPassword(),
          'forgetPass1/': (context) => const ForgetScreen(),
          'onboarding/': (context) => const OnBoarding(),
        },
        title: 'Pet Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
            titleTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[100],
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
        ),
        home: LogIn(),
      ),
    );
  }
}
