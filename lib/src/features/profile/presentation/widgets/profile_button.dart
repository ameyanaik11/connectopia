import 'package:flutter/material.dart';

import '../../../../constants/sizing.dart';
import '../../../../theme/colors.dart';
import '../../application/profile_bloc/profile_bloc.dart';

class OutlinedProfileButton extends StatelessWidget {
  const OutlinedProfileButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.state,
  });

  final String text;
  final Function() onPressed;
  // Looked bad with default skeletonizer
  final ProfileState state;

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
          border: state is ProfileLoadingState
              ? Border.all(color: Pellet.kBlack)
              : Border.all(color: Pellet.kWhite),
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
          color: Pellet.kBlack.withOpacity(0.5),
          border: Border.all(color: Pellet.kWhite),
        ),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
