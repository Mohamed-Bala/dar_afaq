import 'package:flutter/material.dart';

class ArticlesNews extends StatelessWidget {
  const ArticlesNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأخبار والمقالات'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            // --- First Card (Constitutional Court) ---
            _buildConstitutionalCourtCard(context),
            const SizedBox(height: 16.0),
            // --- Second Card (UN Selects Al-Hasbah) ---
            _buildPeopleGridCard(context),
            const SizedBox(height: 16.0),
            // --- Third Card (Ahmed Al-Lahib) ---
            //_buildPersonCard(context),
            _buildConstitutionalCourtCard(context),
            const SizedBox(height: 16.0),

            _buildPeopleGridCard(context),
          ],
        ),
      ),
    );
  }

  // Card 1: Constitutional Court News
  Widget _buildConstitutionalCourtCard(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: [
          // Image Section
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(8.0)),
            child: Container(
              height: 200,
              width: double.infinity,
              // Placeholder for the image of the Constitutional Court
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.pexels.com/photos/2773415/pexels-photo-2773415.jpeg'), // Replace with actual asset path
                  fit: BoxFit.cover,
                ),
              ),
              // To overlay the text from the image for better resemblance
              child: const Stack(
                children: [
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'المحكمة الدستورية',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'CONSTITUTIONAL COURT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Text Section
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              '«الدستورية»: رفض الطعون بعدم دستورية قانون احتكار أراضي الفضاء',
              textAlign: TextAlign.right, // Use right alignment for Arabic text
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Card 2: People Grid News
  Widget _buildPeopleGridCard(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
        child: Column(
          children: [
            // Row of three circular/squarish images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildPersonImage(
                    'https://images.pexels.com/photos/1755695/pexels-photo-1755695.jpeg'), // Left (Male)
                _buildPersonImage(
                    'https://images.pexels.com/photos/2773484/pexels-photo-2773484.jpeg'), // Center (Female)
                _buildPersonImage(
                    'https://images.pexels.com/photos/2773415/pexels-photo-2773415.jpeg'), // Right (Male)
              ],
            ),
            const SizedBox(height: 12.0),
            // Text and Red Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'الأمم المتحدة تختار «دار أفاق» للمنافسة عالمياً',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'عالمي', // Al-Qabas (Newspaper Name)
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  // Helper for the circular images
  Widget _buildPersonImage(String assetPath) {
    return Container(
      width: 100, // Adjusted size to fit three
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blueGrey, // Placeholder color
        borderRadius: BorderRadius.circular(4), // Squarish with rounded corners
        image: DecorationImage(
          image: NetworkImage(assetPath), // Replace with actual asset path
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Card 3: Single Person with Name Overlay
  Widget _buildPersonCard(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Container(
        height: 150, // Fixed height for visual consistency
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue, // Blue background color

          borderRadius: BorderRadius.circular(8.0),
          // Placeholder for the person's image partially visible
          image: const DecorationImage(
            image: AssetImage(
                'https://images.pexels.com/photos/2773415/pexels-photo-2773415.jpeg'), // Replace with actual asset path
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft, // Align to show part of the image
          ),
        ),
        child: const Stack(
          children: [
            // Name Overlay at the bottom
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'أحمد اللهيب', // Ahmed Al-Lahib
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Small Image in the bottom right corner (if it's a separate element)
            Positioned(
              bottom: 10,
              left: 10,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                // Placeholder for the smaller image (e.g., a logo or profile pic)
                backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/2773415/pexels-photo-2773415.jpeg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
