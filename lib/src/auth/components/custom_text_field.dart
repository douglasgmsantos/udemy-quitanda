// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;

  const CustomTextField(
      {Key? key,
      required this.icon,
      required this.label,
      this.isSecret = false})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscureText = false;

  @override
  void initState() {
    super.initState();

    isObscureText = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
          obscureText: isObscureText,
          decoration: InputDecoration(
              prefixIcon: Icon(widget.icon),
              suffixIcon: widget.isSecret
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                      icon: Icon(isObscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    )
                  : null,
              labelText: widget.label,
              isDense: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(18)))),
    );
  }
}
