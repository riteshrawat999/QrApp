import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:qr_scanner_app/bloc/navigation/nav_cubit.dart';
import 'package:qr_scanner_app/constant/colors_code.dart';
import 'package:qr_scanner_app/presentation/widgets/get_page.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavCubit, NavState>(
        builder: (context, state) {
          return Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 2,
            margin: EdgeInsets.only(bottom: 7.0, right: 10.0, left: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10.0,
              ),
              child: GNav(
                gap: MediaQuery.of(context).size.width * 0.01,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.width * 0.05,
                ),
                haptic: true,
                rippleColor: AppColors.buttonColor.withValues(alpha: 255),
                tabBackgroundColor: Color(0xff73bcaa).withAlpha(120),
                tabBorderRadius: 15.0,
                textStyle: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w500,
                ),
                iconSize: MediaQuery.of(context).size.width * 0.06,
                // color: Colors.grey[800],
                activeColor: Color(0xff017e6c).withAlpha(200),
                tabs: [
                  GButton(
                    icon: LucideIcons.scan_line,
                    text: 'Scanner',
                    onPressed: () {
                      context.read<NavCubit>().selectedItem(
                        NavigationItem.scanner,
                      );
                    },
                  ),
                  GButton(
                    icon: LucideIcons.qr_code,
                    text: 'Generator',
                    onPressed: () {
                      context.read<NavCubit>().selectedItem(
                        NavigationItem.generator,
                      );
                    },
                  ),
                  GButton(
                    icon: LucideIcons.history,
                    text: 'History',
                    onPressed: () {
                      context.read<NavCubit>().selectedItem(
                        NavigationItem.history,
                      );
                    },
                  ),
                  GButton(
                    icon: LucideIcons.settings,
                    text: 'Settings',
                    onPressed: () {
                      context.read<NavCubit>().selectedItem(
                        NavigationItem.settings,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: BlocBuilder<NavCubit, NavState>(
        builder: (context, state) {
          return getPage(state.selectedItem.index);
        },
      ),
    );
  }
}
