import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner_app/bloc/contact/contact_qrcode_generate_bloc.dart';
import 'package:qr_scanner_app/constant/colors_code.dart';
import 'package:qr_scanner_app/presentation/widgets/custom_text_form_field.dart';
import 'package:qr_scanner_app/utils/qr-data_function.dart';
import 'package:qr_scanner_app/utils/toast.dart';

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
      body: SingleChildScrollView(
        child: Padding(
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
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    Toast.showError(message: 'Please enter your email');
                    return 'Please enter your email';
                  }
                  final emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(val)) {
                    Toast.showError(message: 'Please enter a valid email');
                    return 'Please enter a valid email';
                  }
                  return null;
                },
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
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],
                Icon(
                  FontAwesomeIcons.phone,
                  size: screenWidth * 0.05,
                  color: AppColors.buttonColor.withAlpha(220),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Qr Cdoe generate
              BlocBuilder<
                ContactQrcodeGenerateBloc,
                ContactQrcodeGenerateState
              >(
                builder: (context, state) {
                  if (state is ContactQrcodeLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.buttonColor,
                      ),
                    );
                  } else if (state is ContactQrcodeFailure) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (state is ContactQrcodeSuccess) {
                    return Center(
                      child: QrImageView(
                        data: state.qrData,
                        version: QrVersions.auto,
                        size: screenWidth * 0.6,
                      ),
                    );
                  }
                  return Center(child: Container());
                },
              ),
              SizedBox(height: screenHeight * 0.02),

              // Generate Button
              Center(
                child: InkWell(
                  onTap: () {
                    // _genQrData();

                    QrDataFunction(
                      context: context,
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      emailController: emailController,
                      phoneController: phoneController,
                    ).genQrData();

                    // function to generate QR code data
                  },
                  child: Chip(
                    label: Text(
                      'Generate',
                      style: GoogleFonts.lato(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    avatar: Icon(
                      FontAwesomeIcons.qrcode,
                      color: AppColors.buttonColor.withAlpha(220),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Row Widget for Save and Share
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        FontAwesomeIcons.solidFloppyDisk,
                        color: AppColors.buttonColor.withAlpha(220),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Chip(
                      label: Text(
                        'Share',
                        style: GoogleFonts.lato(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      avatar: Icon(
                        FontAwesomeIcons.share,
                        color: AppColors.buttonColor.withAlpha(220),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }
}
