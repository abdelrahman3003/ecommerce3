import 'package:flutter/material.dart';

class TextfieldAuth extends StatelessWidget {
  const TextfieldAuth(
      {super.key,
      required this.text,
      required this.onsave,
      required this.validator,
      required this.isnumber,
      required this.obscureText});
  final String text;
  final void Function(String?) onsave;
  final String? Function(String?)? validator;
  final bool isnumber;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 60),
        Expanded(
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.10),
                    spreadRadius: 2,
                    blurRadius: 1,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: TextFormField(
                obscureText: obscureText,
                keyboardType:
                    isnumber ? TextInputType.number : TextInputType.name,
                validator: validator,
                onSaved: onsave,
                decoration: InputDecoration(
                  prefix: const SizedBox(width: 30),
                  hintText: text,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none),
                ),
              )),
        ),
      ],
    );
  }
}
