import 'package:portifolio/features/presentation/about_page.dart';
import 'package:portifolio/features/presentation/home_page.dart';
import 'package:flutter/material.dart';

class ButtonNavegation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const ButtonNavegation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  void _navigateToScreen(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AboutPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        onItemSelected(index);
        _navigateToScreen(context, index);
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          selectedIcon: Icon(Icons.home),
        ),
        NavigationDestination(
          icon: Icon(Icons.more_outlined),
          label: 'Sobre',
          selectedIcon: Icon(Icons.more),
        ),
      ],
    );
  }
}
