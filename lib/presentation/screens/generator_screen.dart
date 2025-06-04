import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_scanner_app/constant/colors_code.dart';
import 'package:qr_scanner_app/presentation/widgets/qr_gen_widget.dart';

class GeneratorScreen extends StatelessWidget {
  const GeneratorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QR & Barcode',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: FontWeight.w500,
            fontSize: 23.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02,
          horizontal: screenWidth * 0.04,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: AppColors.bannerBackColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Enter or paste text to create QR Code',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: screenWidth * 0.35),
                      ElevatedButton(
                        onPressed: () {
                          // Handle QR code generation
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.015,
                          ),
                        ),
                        child: const Text(
                          'Paste',
                          style: TextStyle(
                            color: AppColors.buttonColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle QR code generation
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.015,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/qr_code_gen_screen');
                          },
                          child: const Text(
                            'Create',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.0199),
            Text(
              'QR',
              style: TextStyle(
                fontSize: screenWidth * 0.056,
                color: AppColors.buttonColor,
                fontWeight: FontWeight.w600,
              ),
            ),

            Divider(
              color: AppColors.buttonColor,
              thickness: 2.0,
              height: screenHeight * 0.003,
              endIndent: screenWidth * 0.84,
            ),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                qrGenWidget(
                  onTap: () {
                    Navigator.pushNamed(context, '/contact_gen');
                  },
                  context: context,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  title: 'Contact',
                  icon: FaIcon(
                    FontAwesomeIcons.solidIdBadge,
                    color: Color(0xff47a5ee),
                  ),
                ),
                qrGenWidget(
                  onTap: () {},
                  context: context,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  title: 'Phone',
                  icon: FaIcon(
                    FontAwesomeIcons.phoneVolume,
                    color: Color(0xffef3f4f),
                  ),
                ),
                qrGenWidget(
                  onTap: () {},
                  context: context,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  title: 'Email',
                  icon: FaIcon(
                    size: screenWidth * 0.08,
                    FontAwesomeIcons.squareEnvelope,
                    color: Color(0xfff9aa04),
                  ),
                ),
                qrGenWidget(
                  onTap: () {},
                  context: context,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  title: 'Sms',
                  icon: Container(
                    decoration: BoxDecoration(),
                    child: FaIcon(
                      size: screenWidth * 0.08,
                      FontAwesomeIcons.solidMessage,
                      color: Color(0xff5e6de3),
                    ),
                  ),
                ),
                qrGenWidget(
                  onTap: () {},
                  context: context,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  title: 'Link',
                  icon: FaIcon(
                    size: screenWidth * 0.08,
                    FontAwesomeIcons.link,
                    color: Color(0xff60b8e6),
                  ),
                ),
                qrGenWidget(
                  onTap: () {},
                  context: context,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  title: 'Text',
                  icon: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.8,
                      horizontal: 3.0,
                    ),

                    decoration: BoxDecoration(
                      color: Color(0xffe7c14a),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: FaIcon(
                      size: screenWidth * 0.08,
                      FontAwesomeIcons.bookOpen,
                      color: Color(0xffede8ee),
                    ),
                  ),
                ),
                qrGenWidget(
                  onTap: () {},
                  context: context,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  title: 'Wifi',
                  icon: FaIcon(
                    size: screenWidth * 0.06,
                    FontAwesomeIcons.wifi,
                    color: Color(0xff154c79),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
