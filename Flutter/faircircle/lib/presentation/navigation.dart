import 'package:faircircle/presentation/cart_page.dart';
import 'package:faircircle/presentation/message_page.dart';
import 'package:faircircle/presentation/profile_page.dart';
import 'package:faircircle/presentation/wishlist_page.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  // Navigate to cart page
  static void goToCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage()),
    );
  }

  // Navigate to profile page
  static void goToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  // Navigate to messages page
  static void goToMessages(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MessagesPage()),
    );
  }

  // Navigate to wishlist page
  static void goToWishlist(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WishlistPage()),
    );
  }

  // Navigate using named routes
  static void goToNamedRoute(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
