import 'package:flutter/material.dart';

class PricingPlansPage extends StatefulWidget {
  @override
  _PricingPlansPageState createState() => _PricingPlansPageState();
}

class _PricingPlansPageState extends State<PricingPlansPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> plans = [
    {
      'title': 'BASIC',
      'price': 59,
      'colorStart': Colors.purple,
      'colorEnd': Colors.purpleAccent,
      'features': [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit',
        'euismod tincidunt ut',
        'Ut wisi enim ad minim',
        'Lorem ipsum dolor sit amet',
      ],
    },
    {
      'title': 'STANDARD',
      'price': 79,
      'colorStart': Colors.blue,
      'colorEnd': Colors.blueAccent,
      'features': [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit',
        'euismod tincidunt ut',
        'Ut wisi enim ad minim',
        'Lorem ipsum dolor sit amet',
      ],
    },
    {
      'title': 'PREMIUM',
      'price': 99,
      'colorStart': Colors.pink,
      'colorEnd': Colors.pinkAccent,
      'features': [
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit',
        'euismod tincidunt ut',
        'Ut wisi enim ad minim',
        'Lorem ipsum dolor sit amet',
      ],
    },
    {
      'title': 'VIP',
      'price': 129,
      'colorStart': Colors.orange,
      'colorEnd': Colors.orangeAccent,
      'features': [
        'Premium customer support',
        'Exclusive offers',
        'Access to private events',
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit',
      ],
    },
    {
      'title': 'ULTIMATE',
      'price': 159,
      'colorStart': Colors.green,
      'colorEnd': Colors.greenAccent,
      'features': [
        'Unlimited access',
        'Free workshops',
        'Lifetime membership',
        'Lorem ipsum dolor sit amet',
        'consectetur adipiscing elit',
      ],
    },
  ];

  void _goToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isFirst = _currentPage == 0;
    final isLast = _currentPage == plans.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pricing Plans'),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: plans.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final plan = plans[index];
              return PricingCard(
                title: plan['title'],
                price: plan['price'].toDouble(),
                colorStart: plan['colorStart'],
                colorEnd: plan['colorEnd'],
                features: List<String>.from(plan['features']),
              );
            },
          ),

          // 🔙 Left Arrow
          if (!isFirst)
            Positioned(
              bottom: 40,
              left: 20,
              child: GestureDetector(
                onTap: () => _goToPage(_currentPage - 1),
                child: _navArrow(Icons.arrow_back_ios),
              ),
            ),

          // ➡️ Right Arrow
          if (!isLast)
            Positioned(
              bottom: 40,
              right: 20,
              child: GestureDetector(
                onTap: () => _goToPage(_currentPage + 1),
                child: _navArrow(Icons.arrow_forward_ios),
              ),
            ),

          // 🔵 Dots Indicator
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(plans.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 12 : 8,
                  height: _currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  // Arrow widget builder
  Widget _navArrow(IconData icon) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}

class PricingCard extends StatelessWidget {
  final String title;
  final double price;
  final Color colorStart;
  final Color colorEnd;
  final List<String> features;

  PricingCard({
    required this.title,
    required this.price,
    required this.colorStart,
    required this.colorEnd,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      padding: EdgeInsets.only(top: 30, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [colorStart, colorEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            '\$$price',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          ...features.map(
            (feature) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
              child: Row(
                children: [
                  Icon(Icons.check, color: Colors.white, size: 20),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      feature,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Add to Cart',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: colorStart,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
          ),
           SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'View Weekly Plan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: colorStart,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
