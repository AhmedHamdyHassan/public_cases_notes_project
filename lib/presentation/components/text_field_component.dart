import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    super.key,
    this.onChanged,
    this.controller,
    this.hint = '',
    this.title = '',
    this.prefixIcon,
    this.padding,
  });

  final String hint;
  final Widget? prefixIcon;
  final EdgeInsets? padding;
  final Function(String value)? onChanged;
  final String title;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != '')
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(title),
            ),
          SizedBox(
            height: 50,
            child: TextField(
              controller: controller,
              onChanged: (value) {
                if (onChanged != null) {
                  onChanged!(value);
                }
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                border: const OutlineInputBorder(),
                prefixIcon: prefixIcon,
                hintText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
