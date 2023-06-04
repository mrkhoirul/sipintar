import 'package:flutter/material.dart';
import 'login.dart';

class ForgotPasswordPage extends StatefulWidget {

  const ForgotPasswordPage({super.key});
  @override
  State<ForgotPasswordPage> createState() {
    return _ForgotPasswordPageState();
  }
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  // ignore: prefer_typing_uninitialized_variables
  var passwordVisibility;

  @override
  void initState() {
    super.initState();
    passwordVisibility = true;
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/SiPintar.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: const TextStyle(color: Color(0xFF8CC7FE)),
          suffixIcon: const Icon(Icons.email, color: Color(0xFF8CC7FE)),
          filled: true,
          fillColor: const Color(0xFF2985DA),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(color: Color(0xFF2946DA))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(color: Color(0xFF8CC7FE)))),
    );

    final submitButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(12),
            backgroundColor: const Color(0xFF22355C)),
        onPressed: () =>
          Navigator.push(context, MaterialPageRoute(
            builder: (context) 
              {return const LoginPage();}, 
          ),
        ),
        child: const Text('Submit', style: TextStyle(color: Colors.white)),
      ),
    );

    final goBackLabel = GestureDetector(
      child: const Padding(
        padding: EdgeInsets.only(left: 116.0, right: 58.0),
        child: Text(
          'Go back to Login',
          style: TextStyle(color: Color(0xFF2985DA)),
        ),
      ),
      onTap: () =>
        Navigator.push(context, MaterialPageRoute(
            builder: (context) 
              {return const LoginPage();}, 
          ),
        ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF8CC7FE),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            const SizedBox(height: 48.0),
            email,
            const SizedBox(height: 24.0),
            submitButton,
            goBackLabel
          ],
        ),
      ),
    );
  }
}
