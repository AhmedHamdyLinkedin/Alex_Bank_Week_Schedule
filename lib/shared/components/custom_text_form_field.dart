import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final IconData prefixIcon;
  final bool isPassword;
  final bool isDark;
  final bool isEnabled;
  final IconData? suffixIcon;

  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.prefixIcon,
    required this.isDark,
    this.isEnabled = true,
    this.isPassword = false,
    this.suffixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: widget.isDark ? Colors.white.withOpacity(0.04) : Colors.white,

        border: Border.all(
          color: widget.isDark
              ? Colors.white.withOpacity(0.08)
              : Colors.black.withOpacity(0.05),
        ),

        boxShadow: widget.isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
      ),

      child: TextFormField(
        obscureText: widget.isPassword ? obscure : false,
        style: TextStyle(
          color: widget.isDark ? Colors.white : Colors.black87,
          fontSize: 17,
        ),

        decoration: InputDecoration(
          border: InputBorder.none,
          enabled: widget.isEnabled,
          contentPadding: const EdgeInsets.symmetric(vertical: 22),

          prefixIcon: Icon(
            widget.prefixIcon,
            color: widget.isDark ? Colors.white54 : Colors.black45,
          ),

          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  child: Icon(
                    obscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: widget.isDark ? Colors.white54 : Colors.black45,
                  ),
                )
              : widget.suffixIcon != null
              ? Icon(
                  widget.suffixIcon,
                  size: 32,
                  color: widget.isDark ? Colors.white70 : Colors.grey.shade500,
                )
              : null,

          hintText: widget.hint,

          hintStyle: TextStyle(
            color: widget.isDark ? Colors.white54 : Colors.black45,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
