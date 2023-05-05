import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget itemBuilder(
      BuildContext context, String title, IconData icon, String routeName) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      onTap: () => Navigator.of(context).pushReplacementNamed(routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          padding: EdgeInsets.only(
            left: 16,
            top: MediaQuery.of(context).padding.top,
          ),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Shopping now!!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        itemBuilder(context, 'Shop', Icons.home, '/'),
        itemBuilder(context, 'Orders', Icons.shop, '/orders'),
        itemBuilder(context, 'User Products', Icons.edit, '/user-products'),
      ],
    );
  }
}
