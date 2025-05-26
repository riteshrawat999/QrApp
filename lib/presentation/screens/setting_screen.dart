import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_scanner_app/bloc/theme/theme_bloc.dart';
import 'package:qr_scanner_app/constant/colors_code.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'QR & Barcode',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontWeight: FontWeight.w500,
              fontSize: 23.0,
            ),
          ),
        ),
      ),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is SuccessState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                    ),
                    child: Text(
                      'General Setting',
                      style: TextStyle(
                        color: state.isDark ? Colors.white : Colors.grey,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.circleHalfStroke,
                      size: screenWidth * 0.06,
                      color:
                          state.isDark ? Color(0xfff6f6f6) : Color(0xff5e6de3),
                    ),
                    title: Text(
                      'Dark Mode',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: Switch(
                      focusColor: AppColors.buttonColor,
                      activeColor: AppColors.buttonColor,
                      value: state.isDark,
                      onChanged: (val) {
                        context.read<ThemeBloc>().add(ChangeThemeEvent(val));
                      },
                    ),
                  ),
                  Divider(
                    thickness: screenWidth * 0.002,
                    color: state.isDark ? Colors.black : Colors.grey.shade500,
                    endIndent: screenWidth * 0.03,
                    indent: screenWidth * 0.03,
                    height: screenWidth * 0.0005,
                  ),
                  // clear scan history
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.trash,
                      size: screenWidth * 0.056,
                      color: state.isDark ? Colors.white : Color(0xff60b8e6),
                    ),
                    title: Text(
                      'Clear Scan History',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: screenWidth * 0.002,
                    color: state.isDark ? Colors.black : Colors.grey.shade500,
                    endIndent: screenWidth * 0.03,
                    indent: screenWidth * 0.03,
                    height: screenWidth * 0.0005,
                  ),
                  // About App
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.circleInfo,
                      size: screenWidth * 0.06,
                      color: state.isDark ? Colors.white : Color(0xff47a5ee),
                    ),
                    title: Text(
                      'About App',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: screenWidth * 0.002,
                    color: state.isDark ? Colors.black : Colors.grey.shade500,
                    endIndent: screenWidth * 0.03,
                    indent: screenWidth * 0.03,
                    height: screenWidth * 0.0005,
                  ),
                  // Privacy Policy
                  ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.shieldHeart,
                      size: screenWidth * 0.06,
                      color:
                          state.isDark
                              ? Colors.white
                              : Color.fromARGB(255, 225, 50, 71),
                    ),
                    title: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: screenWidth * 0.002,
                    color: state.isDark ? Colors.black : Colors.grey.shade500,
                    endIndent: screenWidth * 0.03,
                    indent: screenWidth * 0.03,
                    height: screenWidth * 0.0005,
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
