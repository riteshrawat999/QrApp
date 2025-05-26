import 'package:flutter/material.dart';
import 'package:qr_scanner_app/constant/colors_code.dart';
import 'package:qr_scanner_app/presentation/tabsBar/created_tab.dart';
import 'package:qr_scanner_app/presentation/tabsBar/favorities_tab.dart';
import 'package:qr_scanner_app/presentation/tabsBar/scanned_tab.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double screenHeight = MediaQuery.of(context).size.height;
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

        bottom: TabBar(
          indicatorPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
          ),
          controller: _tabController,
          labelColor: AppColors.buttonColor,
          dividerColor: Colors.transparent,
          indicatorColor: AppColors.buttonColor,
          unselectedLabelColor: Colors.grey[700],
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.04,
          ),
          indicator: BoxDecoration(
            color: AppColors.buttonColor.withAlpha(40),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.transparent,
              width: screenWidth * 0.002,
            ),
          ),

          tabs: [
            Tab(text: "Scanned"),
            Tab(text: "Created"),
            Tab(text: "Favorites"),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        child: TabBarView(
          controller: _tabController,
          children: [ScannedTab(), CreatedTab(), FavoritiesTab()],
        ),
      ),
    );
  }
}
