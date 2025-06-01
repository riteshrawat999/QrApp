import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_scanner_app/constant/colors_code.dart';
import 'package:qr_scanner_app/presentation/widgets/custom_text_form_field.dart';

class ContactGenScreen extends StatelessWidget {
  const ContactGenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final TextEditingController _controller = TextEditingController();
    final TextEditingController _lastNameCon = TextEditingController();
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
            SizedBox(height: screenHeight * 0.02,),
            customTextField(_lastNameCon, context, 'John', 'Your First Name',TextInputType.name),
            SizedBox(height: screenHeight * 0.02,),
            SizedBox(height: screenHeight * 0.02,),
            customTextField(_lastNameCon, context, 'Doe', 'Your Last Name',TextInputType.name),
            SizedBox(height: screenHeight * 0.02,),
            customTextField(_lastNameCon, context, 'john@gmail.com', 'Your E-mail',TextInputType.emailAddress),
            SizedBox(height: screenHeight * 0.02,),
            customTextField(_lastNameCon, context, '9875875545', 'Your phone',TextInputType.phone),
            SizedBox(height: screenHeight * 0.02,),
          ],
        ),
      ),
    );
  }
}
