import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // Rx variables
  RxBool isSkipAuth = false.obs;
  RxInt selectedIndex = 0.obs;

  // Pages and bottom navbar items (start empty)
  final RxList<Widget> pages = <Widget>[].obs;
  final RxList<BottomNavigationBarItem> bottomNavbarItem =
      <BottomNavigationBarItem>[].obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    final arguments = Get.arguments ?? {};
    isSkipAuth.value = arguments['is_skip_auth'] ?? false;

    // Always start with at least two items
    pages.add(Center(child: Text('Home')));
    pages.add(Center(child: Text('Profile')));

    bottomNavbarItem.addAll([
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ]);

    // If not skipping auth, insert Search and Notifications between Home and Profile
    if (!isSkipAuth.value) {
      pages.insertAll(1, [
        Center(child: Text('Search')),
        Center(child: Text('Notifications')),
      ]);

      bottomNavbarItem.insertAll(1, [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
      ]);
    }

    super.onInit();
  }
}
