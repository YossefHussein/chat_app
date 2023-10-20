import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/state_manegemnt/main_provider.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // sign up user
  void singUp() async {
    // ignore: unrelated_type_equality_checks
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password do not match'),
        ),
      );
      return;
    }
    // get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailedPassword(
          email: emailController.text,
          password: passwordController.text,
          userName: userNameController.text);
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    MainProvider mainProvider = Provider.of<MainProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 25),
                  // logo
                  Icon(
                    Icons.message,
                    size: 80,
                    color: Colors.grey.shade800,
                  ),
                  const SizedBox(height: 25),
                  // welcome
                  const Text(
                    'Let\'s create chat',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  // user name text field
                  MyTextField(
                      controller: userNameController,
                      hintText: 'User name',
                      isPassword: false,
                      ),
                  const SizedBox(height: 25),
                  // email text field
                  MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      isPassword: false,
                    ),
                  const SizedBox(height: 25),
                  // password text field
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    isPassword: mainProvider.isPassword,
                    suffixPressed: () {
                      setState(() {
                        mainProvider.isPassword = !mainProvider.isPassword;
                      });
                    },
                    suffixIcon: mainProvider.isPassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  
                  ),
                  const SizedBox(height: 25),
                  // confirm password
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm password',
                    isPassword: mainProvider.isPassword,
                    suffixPressed: () {
                      setState(() {
                        mainProvider.isPassword = !mainProvider.isPassword;
                      });
                    },
                    suffixIcon: mainProvider.isPassword
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                 
                  ),
                  const SizedBox(height: 25),
                  // sign in button
                  MyButton(
                    onTap: singUp,
                    text: 'Sing up',
                  ),
                  const SizedBox(height: 25),
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already member?'),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text('Sing in now'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
