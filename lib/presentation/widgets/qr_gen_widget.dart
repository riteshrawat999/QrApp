import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_scanner_app/bloc/theme/theme_bloc.dart';

Widget qrGenWidget({
  required screenHeight,
  required double screenWidth,
  required String title,
  required Widget icon,
  required BuildContext context,
}) {
  return BlocBuilder<ThemeBloc, ThemeState>(
    builder: (context, state) {
      return Column(
        children: [
          Container(
            height: screenHeight * 0.09,
            margin: EdgeInsets.all(screenWidth * 0.02),
            decoration: BoxDecoration(
              // color: Color(0xfff6f6f6),
              color: state.isDark ? Colors.black12 : Color(0xfff6f6f6),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(child: icon),
          ),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );
    },
  );
}
