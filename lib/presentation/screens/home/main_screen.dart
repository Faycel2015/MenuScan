import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const orange = Color(0xFFFF6B35);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MenuScan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: orange.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.restaurant_menu,
                size: 80,
                color: orange,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Welcome to MenuScan',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Scan, translate & explore menus worldwide',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6C757D),
                ),
              ),
            ),
            const SizedBox(height: 50),

            // ---- SCAN MENU BUTTON ----
            Material(
              elevation: 4,
              shadowColor: orange.withOpacity(0.4),
              borderRadius: BorderRadius.circular(30),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt),
                label: const Text('Scan Menu'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 16),
                  shape: const StadiumBorder(),
                  elevation: 0, // handled by Material
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ---- IMPORT FROM GALLERY BUTTON ----
            Material(
              color: Colors.white,
              elevation: 4,
              shadowColor: orange.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                splashColor: orange.withOpacity(0.15),
                onTap: () {
                  // action here
                },
                child: OutlinedButton.icon(
                  onPressed: null, // disabled because InkWell handles it
                  icon: const Icon(Icons.photo_library, size: 22),
                  label: const Text(
                    'Import from Gallery',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: orange,
                    side: const BorderSide(color: orange, width: 2),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 14),
                    shape: const StadiumBorder(),
                    textStyle: const TextStyle(fontSize: 16),
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}