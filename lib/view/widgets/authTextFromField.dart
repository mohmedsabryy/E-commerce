import 'package:flutter/material.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller ;
final bool obscureText ;
final Function validator ;
final Widget prefixIcon ;
final Widget suffixIcon ;
final TextStyle textStyle ;
final String hintText ;

  const AuthTextFromField({
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.textStyle,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle,
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value){
        return validator(value);
      },
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200 ,
        prefixIcon:prefixIcon ,
        suffixIcon: suffixIcon,
        hintText:hintText ,
        hintStyle: const TextStyle(
          color: Colors.black45 ,
          fontSize: 16 ,
          fontWeight: FontWeight.w500 ,

        ),
        filled: true ,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,

          ),
          borderRadius: BorderRadius.circular(10),

        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,

          ),
          borderRadius: BorderRadius.circular(10),

        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,

          ),
          borderRadius: BorderRadius.circular(10),

        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,

          ),
          borderRadius: BorderRadius.circular(10),

        ),


      ),

    );
  }
}
