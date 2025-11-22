import 'package:dar_afaq/core/helper/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/resources/color_manager.dart';
import '../../core/routing/routes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isArabicSelected = false; // State for the language switch

  @override
  Widget build(BuildContext context) {
    // Determine the width of the drawer
    final double screenWidth = MediaQuery.of(context).size.width;
    final double drawerWidth = screenWidth * 0.8;
    return SizedBox(
      width: drawerWidth,
      child: Drawer(
        backgroundColor: ColorManager.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 40.0,
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      context.pushNamed(Routes.editProfileRoute);
                    },
                    child: Row(
                      children: [
                        // Placeholder for the profile picture
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors
                              .blueAccent[100], // Example background for avatar
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.black,
                          ), // Placeholder person icon
                          // If you have an actual image:
                          // backgroundImage: AssetImage('assets/profile_pic.png'),
                        ),
                        const SizedBox(width: 15),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Attallah Alrekhaimi',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'تعديل الملف الشخصي',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            profileListItem(),
          ],
        ),
      ),
    );
  }

  Expanded profileListItem() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildDrawerItem(
            icon: Icons.location_on,
            text: 'العنوان',
            onTap: () {},
          ),
          buildDrawerItem(
            icon: Icons.language,
            text: 'اللغة',
            trailingWidget: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Arabic', style: TextStyle(color: Colors.white)),
                const SizedBox(width: 8),
                Switch(
                  value: _isArabicSelected,
                  onChanged: (bool value) {
                    setState(() {
                      _isArabicSelected = value;
                    });
                  },
                  activeColor: ColorManager.primary,
                  inactiveTrackColor: Colors.grey[400],
                  activeTrackColor: Colors.black.withOpacity(0.5),
                ),
              ],
            ),
            onTap: () {},
          ),
          buildDrawerItem(
            icon: Icons.info_outline,
            text: 'التواصل معنا',
            onTap: () {},
          ),
          buildDrawerItem(
            icon: Icons.logout,
            text: 'تسجيل خروج',
            onTap: () {},
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildDrawerItem({
    required IconData icon,
    required String text,
    Widget? trailingWidget,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
      trailing: trailingWidget ??
          const Icon(Icons.chevron_right, color: Colors.black),
      onTap: onTap,
    );
  }
}
