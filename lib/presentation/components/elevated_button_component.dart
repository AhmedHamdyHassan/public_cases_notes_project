import 'package:flutter/material.dart';

class ElevatedButtonComponent extends StatelessWidget {
  const ElevatedButtonComponent({
    super.key,
    required this.title,
    required this.onPress,
    this.isSelected = false,
    this.padding,
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
  });

  final Color backgroundColor;
  final Color foregroundColor;
  final String title;
  final Function onPress;
  final EdgeInsets? padding;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          fixedSize: const Size(20, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          foregroundColor: foregroundColor,
        ),
        onPressed: () async => await onPress(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            if (isSelected)
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(Icons.done),
              ),
          ],
        ),
      ),
    );
  }
}
