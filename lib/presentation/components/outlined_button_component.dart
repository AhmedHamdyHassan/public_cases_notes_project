import 'package:flutter/material.dart';

class OutlinedButtonComponent extends StatelessWidget {
  const OutlinedButtonComponent({
    super.key,
    required this.title,
    required this.onPress,
    this.padding,
  });

  final String title;
  final EdgeInsets? padding;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          fixedSize: Size(MediaQuery.of(context).size.width, 50),
        ),
        onPressed: () async => await onPress(),
        child: Text(title),
      ),
    );
  }
}
