import 'package:flutter/material.dart';

class AdDetailsPage extends StatelessWidget {
  const AdDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final adId = ModalRoute.of(context)?.settings.arguments ?? "Unknown";

    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل الإعلان $adId")),
      body: Center(child: Text("هنا تظهر تفاصيل الإعلان: $adId")),
    );
  }
}
