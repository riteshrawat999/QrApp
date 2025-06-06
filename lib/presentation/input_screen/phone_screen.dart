import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner_app/bloc/phone/bloc/phone_bloc.dart';
import 'package:qr_scanner_app/constant/colors_code.dart';
import 'package:qr_scanner_app/utils/toast.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Visibility(visible: false, child: const Text('')),
        centerTitle: true,
        title: Text(
          'Phone QR',
          style: GoogleFonts.lato(
            fontSize: screenWidth * 0.05,
            fontWeight: FontWeight.w500,
            color: AppColors.buttonColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Form(
            child: Column(
              children: <Widget>[
                Text(
                  "Enter your phone number to continue",
                  style: GoogleFonts.lato(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                // text field
                TextFormField(
                  controller: phoneController,
                  maxLength: 10,
                  cursorColor: AppColors.buttonColor,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      FontAwesomeIcons.phone,
                      color: AppColors.buttonColor,
                    ),
                    labelText: 'Enter Phone Number',
                    focusColor: Colors.black54,
                    labelStyle: GoogleFonts.lato(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonColor,
                    ),
                    counterStyle: TextStyle(color: Colors.black54),

                    prefixText: "+91 ",
                    prefixStyle: GoogleFonts.lato(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: AppColors.buttonColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(height: screenHeight * 0.01),
                BlocConsumer<PhoneBloc, PhoneState>(
                  listener: (context, state) {
                    if (state is PhoneQrError) {
                      Toast.showError(message: state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is PhoneQrGenerated) {
                      return Column(
                        children: [
                          QrImageView(
                            data: state.qrData,
                            size: screenWidth * 0.5,
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Reset QR
                              InkWell(
                                onTap: () {
                                  context.read<PhoneBloc>().add(
                                    PhoneQrResetEvent(),
                                  );
                                },
                                child: Chip(
                                  label: Text(
                                    'Reset QR',
                                    style: GoogleFonts.lato(
                                      color: Colors.black45,
                                    ),
                                  ),
                                  avatar: Icon(
                                    FontAwesomeIcons.refresh,
                                    color: AppColors.buttonColor,
                                  ),
                                ),
                              ),
                              // Download QR
                              Chip(
                                label: Text(
                                  'Download',
                                  style: GoogleFonts.lato(
                                    color: Colors.black45,
                                  ),
                                ),
                                avatar: Icon(
                                  FontAwesomeIcons.download,
                                  color: AppColors.buttonColor,
                                ),
                              ),
                              // Save QR
                              Chip(
                                label: Text(
                                  'Save',
                                  style: GoogleFonts.lato(
                                    color: Colors.black45,
                                  ),
                                ),
                                avatar: Icon(
                                  FontAwesomeIcons.solidSave,
                                  color: AppColors.buttonColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                BlocBuilder<PhoneBloc, PhoneState>(
                  builder: (context, state) {
                    if (state is! PhoneQrGenerated) {
                      return InkWell(
                        onTap: () {
                          context.read<PhoneBloc>().add(
                            GenereatePhoneQrEvent(
                              phoneNumber: phoneController.text.toString(),
                            ),
                          );
                        },
                        child: Chip(
                          label: Text(
                            'Generate',
                            style: GoogleFonts.lato(color: Colors.black45),
                          ),
                          avatar: Icon(
                            FontAwesomeIcons.qrcode,
                            color: AppColors.buttonColor,
                          ),
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }
}
