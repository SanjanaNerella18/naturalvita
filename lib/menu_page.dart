import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Page',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Blue theme
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemCount: 7,
          itemBuilder: (context, index) {
            return MenuButton(
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final int index;

  MenuButton({required this.index});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> menuItems = [
      {'label': 'My Plan', 'icon': Icons.account_circle, 'page': MyPlanPage()},
      {'label': 'Set Vacation', 'icon': Icons.beach_access, 'page': SetVacationPage()},
      {'label': 'My Orders', 'icon': Icons.shopping_cart, 'page': MyOrdersPage()},
      {'label': 'Refer', 'icon': Icons.person_add, 'page': ReferPage()},
      {'label': 'Help', 'icon': Icons.help_outline, 'page': HelpPage()},
      {'label': 'Accounts and Preferences', 'icon': Icons.account_box, 'page': AccountsPreferencesPage()},
      {'label': 'Delivery Preferences', 'icon': Icons.delivery_dining, 'page': DeliveryPreferencesPage()},
    ];

    var menuItem = menuItems[index];

    return Card(
      elevation: 6,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => menuItem['page']),
          );
        },
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              menuItem['icon'],
              size: 40,
              color: Colors.blue, // Icon color is blue
            ),
            SizedBox(height: 8),
            Text(
              menuItem['label'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Text color is dark gray
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class MyPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Plan')),
      body: Center(child: Text('Details of My Plan')),
    );
  }
}

class SetVacationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Vacation')),
      body: Center(child: Text('Details of Set Vacation')),
    );
  }
}

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Orders')),
      body: Center(child: Text('Details of My Orders')),
    );
  }
}

class ReferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Refer')),
      body: Center(child: Text('Details of Refer')),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: Center(child: Text('Details of Help')),
    );
  }
}

class AccountsPreferencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accounts and Preferences')),
      body: Center(child: Text('Details of Accounts and Preferences')),
    );
  }
}

class DeliveryPreferencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Delivery Preferences')),
      body: Center(child: Text('Details of Delivery Preferences')),
    );
  }
}
