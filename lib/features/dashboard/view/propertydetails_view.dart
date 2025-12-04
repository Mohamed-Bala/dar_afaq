import 'package:dar_afaq/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// --- Color Palette ---
// Defining the main colors used in the ad.
const Color kPrimaryColor = Color(0xFF003049); // Dark blue/black for text
const Color kAccentColor = Color(0xFFFFB700); // Yellow/Orange for highlights
const Color kBackgroundColor = Colors.white;

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Ensure RTL layout
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true, // Image goes behind app bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.share, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- 1. Header/Logo Section ---
              Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.pexels.com/photos/26556320/pexels-photo-26556320.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // --- 2. Title & Price Section ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'للبيع ارض في الزهراء زاويه شارعين وسكه ثلاث',
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'واجهات ٤١٨ متر',
                      textAlign: TextAlign.right,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'د.ك',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '495,000',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'الزهراء',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.location_on,
                                color: Colors.grey, size: 16),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '463',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.grey,
                              size: 16,
                            ),
                          ],
                        ),
                        Text(
                          '23.11.2025',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Date and Views
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // --- 3. Tags (Buttons) ---
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       _buildTag('ارض فضاء', true), // Highlighted tag
              //       const SizedBox(width: 10),
              //       _buildTag('للبيع', false),
              //       const SizedBox(width: 10),
              //       _buildTag('سكني', false),
              //     ],
              //   ),
              // ),
              // const Divider(thickness: 1, height: 30),
              // // --- 4. Specs Section ---
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       // Icon column
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           _buildSpecRow('418 م2', Icons.aspect_ratio),
              //           const SizedBox(height: 10),
              //           _buildSpecRow(
              //               '2', Icons.king_bed), // Placeholder for bedrooms
              //           const SizedBox(height: 10),
              //           _buildSpecRow(
              //               '-', Icons.bathtub), // Placeholder for bathrooms
              //           const SizedBox(height: 10),
              //           _buildSpecRow(
              //               '-', Icons.home), // Placeholder for floor count
              //         ],
              //       ),
              //       const SizedBox(width: 20),
              //       // Label column
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           _buildSpecRow('-', null), // Empty to align with meter
              //           const SizedBox(height: 10),
              //           _buildSpecRow('-', null), // Empty to align with bed
              //           const SizedBox(height: 10),
              //           _buildSpecRow('-', null), // Empty to align with bath
              //           const SizedBox(height: 10),
              //           _buildSpecRow('-', null), // Empty to align with home
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
              const Divider(thickness: 1, height: 30),
              // --- 5. Property Details (عن العقار) ---
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'عن الاعلان',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'للبيع ارض فضاء في الزهراء',
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      'المساحة 418 متر قطعة 3',
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      'الموقع زاوية شارعين + سكة جانبية',
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      'ثلاث واجهات قريبة من الممشى',
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      'السعر 495 الف .',
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // --- 6. Boubyan Bank Ad & Financing Question ---

              const SizedBox(height: 80), // Space for the fixed footer
            ],
          ),
        ),
        // --- 7. Fixed Bottom Navigation Bar/Contact Bar ---
        bottomSheet: Container(
          color: kBackgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: kPrimaryColor,
                          child: Icon(Icons.person, color: kAccentColor),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'مؤسسة الوداد العقارية',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'مكتب الوداد العقاري',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              // Contact Buttons
              _buildContactButton(Icons.call, kPrimaryColor),
              const SizedBox(width: 10),
              _buildContactButton(Icons.chat_bubble_outline, kPrimaryColor),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Widget for Spec Rows (e.g., Area, Bedrooms)
  Widget _buildSpecRow(String text, IconData? icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (icon != null) Icon(icon, color: Colors.grey.shade700, size: 24),
        if (icon != null) const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700),
        ),
      ],
    );
  }

  // Helper Widget for Tags (Buttons)
  Widget _buildTag(String text, bool isHighlighted) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFFF0F0F0) : kBackgroundColor,
        border: Border.all(
            color: isHighlighted ? Colors.grey.shade300 : Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  // Helper Widget for Contact Buttons
  Widget _buildContactButton(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
