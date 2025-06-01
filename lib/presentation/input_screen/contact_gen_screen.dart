import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner_app/constant/colors_code.dart';
import 'package:qr_scanner_app/presentation/widgets/custom_text_form_field.dart';

class ContactGenScreen extends StatefulWidget {
  const ContactGenScreen({super.key});

  @override
  State<ContactGenScreen> createState() => _ContactGenScreenState();
}

class _ContactGenScreenState extends State<ContactGenScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        leading: Visibility(visible: false, child: Icon(Icons.error)),
        centerTitle: true,
        title: Text(
          'Contact',
          style: GoogleFonts.monoton(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.05,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Let's get to know you",
                style: GoogleFonts.monoton(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.w300,
                  fontSize: screenWidth * 0.045,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            customTextField(
              firstNameController,
              context,
              'John',
              'Your First Name',
              TextInputType.name,
              Icon(
                FontAwesomeIcons.person,
                size: screenWidth * 0.05,
                color: AppColors.buttonColor.withAlpha(220),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            customTextField(
              lastNameController,
              context,
              'Doe',
              'Your Last Name',
              TextInputType.name,
              Icon(
                FontAwesomeIcons.person,
                size: screenWidth * 0.05,
                color: AppColors.buttonColor.withAlpha(220),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            customTextField(
              emailController,
              context,
              'john@gmail.com',
              'Your E-mail',
              TextInputType.emailAddress,
              Icon(
                FontAwesomeIcons.squareEnvelope,
                size: screenWidth * 0.05,
                color: AppColors.buttonColor.withAlpha(220),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            customTextField(
              phoneController,
              context,
              '9875875545',
              'Your phone',
              TextInputType.phone,
              Icon(
                FontAwesomeIcons.phone,
                size: screenWidth * 0.05,
                color: AppColors.buttonColor.withAlpha(220),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // Qr Cdoe generate
            Center(
              child: QrImageView(
                data: 'ritesh@gmail.com',
                version: QrVersions.auto,
                size: screenWidth * 0.6,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Chip(
                  label: Text(
                    'Save',
                    style: GoogleFonts.lato(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  avatar: Icon(
                    FontAwesomeIcons.floppyDisk,
                    color: AppColors.buttonColor.withAlpha(220),
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
