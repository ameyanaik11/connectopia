import 'package:connectopia/src/constants/sizing.dart';
import 'package:connectopia/src/theme/colors.dart';
import 'package:flutter/material.dart';

class OutlinedProfileButton extends StatelessWidget {
  const OutlinedProfileButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final _height = ScreenSize.height(context);
    final _width = ScreenSize.width(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _width * 10,
          vertical: _height * 1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 0.5, color: Pellete.kWhite),
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class EditBannerButton extends StatelessWidget {
  const EditBannerButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final _height = ScreenSize.height(context);
    final _width = ScreenSize.width(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _width * 5,
          vertical: _height * 1,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Pellete.kBlack.withOpacity(0.5),
          border: Border.all(color: Pellete.kWhite),
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}