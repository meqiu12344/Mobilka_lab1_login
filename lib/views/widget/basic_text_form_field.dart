import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class BasicTextFormField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool isPassword;

  const BasicTextFormField({
    super.key,
    this.hintText = '',
    this.prefixIcon,
    this.isPassword = false,
  });

  @override
  State<BasicTextFormField> createState() => _BasicTextFormFieldState();
}

class _BasicTextFormFieldState extends State<BasicTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),

        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: AppColors.purpleColor)
            : null,

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.purpleColor, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.purpleColor, width: 2.0),
        ),
      ),
    );
  }
}
