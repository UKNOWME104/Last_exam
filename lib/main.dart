import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF6750A4),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Position variables for categories
  double groceryX = 0, groceryY = 0;
  double foodX = 0, foodY = 0;
  double shoppingX = 0, shoppingY = 0;
  double transportX = 0, transportY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Weekly Expense',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C1B1F),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'View Report',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'From 1 - 6 Apr, 2024',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF797880),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 300,
              child: Stack(
                children: [
                  // 48% circle (manual positioning)
                  Positioned(
                    top: 0,
                    left: 20,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Color(0xFFEADDFF),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '48%',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6750A4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 32% circle (manual positioning)
                  Positioned(
                    top: 0,
                    left: 220,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD0F8CE),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '32%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF388E3C),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 13% circle (manual positioning)
                  Positioned(
                    top: 140,
                    left: 190,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFCE8E0),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '13%',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB00020),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 7% circle (manual positioning)
                  Positioned(
                    top: 125,
                    left: 300,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF8E1),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '7%',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF57C00),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              '     - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -', // Hardcoded dashed line
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF797880),
              ),
            ),
            // Wrap the categories in a Stack, so we can use Positioned
            Container(
              width: double.infinity, // Add a width constraint
              height: 250, // Add a height constraint
              child: Stack(
                children: [
                  // Grocery Category (manual positioning)
                  Positioned(
                    top: 20,
                    left: 20,
                    child: _buildCategoryColumn('Grocery', '\$758.20', const Color(0xFF6750A4)),
                  ),
                  // Food & Drink Category (manual positioning)
                  Positioned(
                    top: 20,
                    left: 215,
                    child: _buildCategoryColumn('Food & Drink', '\$758.20', const Color(0xFF388E3C)),
                  ),
                  Positioned(
                    top: 75,
                    left: 0,
                    child: const Text(
                      '     - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -', // Hardcoded dashed line
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF797880),
                      ),
                    ),
                  ),
                  // Shopping Category (manual positioning)
                  Positioned(
                    top: 100,
                    left: 20,
                    child: _buildCategoryColumn('Shopping', '\$758.20', const Color(0xFFB00020)),
                  ),
                  // Transportation Category (manual positioning)
                  Positioned(
                    top: 100,
                    left: 215,
                    child: _buildCategoryColumn('Transportation', '\$758.20', const Color(0xFFF57C00)),
                  ),
                ],
              ),
            ),
            const Spacer(),

          ],
        ),
      ),
    );
  }

  // Category column (manual positioning)
  Widget _buildCategoryColumn(String title, String amount, Color color) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 6,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        ),
      ],
    );
  }
}
