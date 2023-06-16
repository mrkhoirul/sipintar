import 'package:flutter/material.dart';
import 'home.dart';
import 'course.dart';
import 'mycourse.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      BottomNavigationBarPageState();
}

class BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  final GlobalKey<NavigatorState> navbar = GlobalKey<NavigatorState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(
          key: navbar,
          onGenerateRoute: route,
        ),
        bottomNavigationBar: widgetBottomNavbar(context),
      ),
    );
  }

  Widget widgetBottomNavbar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      currentIndex: index,
      onTap: ontap,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Course'),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'My Course'),
      ],
    );
  }

  ontap(int newIndex) {
    setState(() => index = newIndex);
    switch (newIndex) {
      case 0:
        navbar.currentState?.pushReplacementNamed("Home");
        break;
      case 1:
        navbar.currentState?.pushReplacementNamed("Course");
        break;
      case 2:
        navbar.currentState?.pushReplacementNamed("My Course");
        break;
    }
  }

  Route<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case "Course":
        return MaterialPageRoute(builder: (context) {
          return const CoursePage();
        });
      case "My Course":
        return MaterialPageRoute(builder: (context) {
          return const MyCoursePage();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
    }
  }
}
