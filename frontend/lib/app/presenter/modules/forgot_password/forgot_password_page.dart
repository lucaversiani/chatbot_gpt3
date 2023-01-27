import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'forgot_password_controller.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _controller = Get.find<ForgotPasswordController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Align(
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FaIcon(FontAwesomeIcons.key, size: 50),
                    const SizedBox(height: 30),
                    const Text("Retrieve Password",
                        style: TextStyle(fontSize: 30)),
                    const SizedBox(height: 15),
                    const Text(
                      "You will receive the instructions via email",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      onChanged: (value) => setState(() {}),
                      controller: _controller.emailController.value,
                      validator: (string) {
                        if (string == '' || string == null) {
                          return "Required field.";
                        } else if (!GetUtils.isEmail(string)) {
                          return "Invalid e-mail.";
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade800),
                              borderRadius: BorderRadius.circular(7.5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade800),
                              borderRadius: BorderRadius.circular(7.5)),
                          hintText: "Email",
                          helperText: ' ',
                          errorStyle:
                              const TextStyle(fontSize: 12, color: Colors.red),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(7.5)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(7.5)),
                          hintStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 12),
                          prefixIcon:
                              const Icon(Icons.email_outlined, size: 14)),
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.5)),
                      padding: const EdgeInsets.all(20),
                      onPressed: _controller.isLoading.value
                          ? () {}
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                await _controller.sendForgottenPasswordEmail();
                              }
                            },
                      color: const Color(0xff11a37f),
                      child: _controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Continue",
                              style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Remember your account? ",
                            style: TextStyle(fontSize: 12)),
                        TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () => Get.offAllNamed('/login'),
                            child: const Text("Sign in!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff11a37f),
                                    fontSize: 12)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
