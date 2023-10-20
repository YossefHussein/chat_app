import 'package:flutter/material.dart';

// class MyTextField extends StatefulWidget {
//   final String hint;
//   bool? obscureText = false;
//   final VoidCallback? suffixPressed;
//   final TextEditingController? controller;
//   final String? labelText;
//   final String? helperText;
//   final bool isPassword = false;
//   final FormFieldValidator<String>? validMsg;
//   final ValueChanged<String>? onSubmits;
//   final ValueChanged<String>? onChanged;
//   final TextInputType? type;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//
//   MyTextField({
//     Key? key,
//     required this.controller,
//     required this.hint,
//     this.obscureText,
//     this.suffixPressed,
//     this.labelText,
//     this.helperText,
//     this.validMsg,
//     this.onSubmits,
//     this.onChanged,
//     this.type,
//     this.prefixIcon,
//      this.suffixIcon,
//   }) : super(key: key);
//
//   @override
//   State<MyTextField> createState() => _MyTextFieldState();
// }
//
// class _MyTextFieldState extends State<MyTextField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: widget.controller,
//       obscureText: widget.obscureText = false,
//       decoration: InputDecoration(
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.white,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.grey.shade200,
//           ),
//         ),
//         fillColor: Colors.grey.shade300,
//         filled: true,
//         hintStyle: const TextStyle(color: Colors.grey),
//         prefixIconColor: Colors.white,
//         suffixIconColor: Colors.white,
//         prefixIcon: widget.prefixIcon,
//         suffixIcon: widget.suffixIcon != null
//             ? IconButton(
//                 onPressed: widget.suffixPressed, icon: widget.suffixIcon)
//             : null,
//         hintText: widget.hint,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//     );
//   }
// }

Widget MyTextField({
 required final TextEditingController? controller,
  final String? labelText,
  final String? hintText,
  final String? helperText,
  bool isPassword = false,
  final FormFieldValidator<String>? validMsg,
  final ValueChanged<String>? onSubmits,
  final ValueChanged<String>? onChanged,
  final TextInputType? type,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
  final VoidCallback? suffixPressed,
}) {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) => TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmits,
      onChanged: onChanged,
      obscureText: isPassword,
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        prefixIconColor: Colors.white,
        suffixIconColor: Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: suffixPressed, icon: suffixIcon)
            : null,
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
        fillColor: Colors.grey.shade300,
        filled: true,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      validator: validMsg,
    ),
  );
}
