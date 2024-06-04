import 'package:carcom/Views/screens/Profile/view_profile.dart';
import 'package:carcom/Views/screens/notification/admin_Notification_page.dart';
import 'package:carcom/Views/screens/admin_screens/admin_cardealers_list.dart';
import 'package:carcom/Views/screens/admin_screens/admin_customer_carslist.dart';
import 'package:carcom/Views/screens/admin_screens/admin_customers_list.dart';
import 'package:carcom/Views/screens/reservation_screens/admin_reservation_list.dart';
import 'package:carcom/Views/screens/car_dealer/cardealer_cars_list.dart';
import 'package:carcom/Views/screens/notification/cardealer_notification.dart';
import 'package:carcom/Views/screens/car_dealer/cardealer_reservation_list.dart';
import 'package:carcom/Views/screens/intro_screenes/choose_account.dart';
import 'package:carcom/Views/screens/customer_screen/customer_favourit.dart';
import 'package:carcom/Views/screens/admin_screens/homepage_admin.dart';
import 'package:carcom/Views/screens/car_dealer/homepage_cardealer.dart';
import 'package:carcom/Views/screens/customer_screen/homepage_customer.dart';
import 'package:carcom/Views/screens/intro_screenes/login.dart';
import 'package:carcom/Views/screens/car_dealer/signup_car_dealer.dart';
import 'package:carcom/Views/screens/customer_screen/signup_customer.dart';
import 'package:carcom/Views/screens/add_screens/add_car_cardealer_and_customer.dart';
import 'package:flutter/material.dart';

//navigation between all views page in app
class NavigationController {
  void navigateToNotificCardealerPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NotificationsPage()),
    );
  }
void navigateToAddCarByCardealerPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddCarCardealer()),
    );
  }

  void navigateToCardealerReservationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CarDealerReservationList()),
    );
  }

  void navigateToCardealerCarsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CarDealerCarList()),
    );
  }

  void navigateToFavoritCustomerPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CustomerFavoritePage()),
    );
  }

  void navigateToUserProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ViewProfile()),
    );
  }

  void navigateToAdminNotifyPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminPageNotification()),
    );
  }

  // Function to handle navigation to the ChooseAccount page
  void navigateToChooseAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseAccount()),
    );
  }

  // Function to handle navigation to the Login page
  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  void navigateToCarDealerSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupCardealer()),
    );
  }

  void navigateToCustomerSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupCustomer()),
    );
  }

  void navigateToHomePageCustomer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomepageCustomer()),
    );
  }

  void navigateToHomePageCarDealer(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePageCarDealer()),
    );
  }

  void navigateToViewProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ViewProfile()),
    );
  }

  void navigateToAdminHomePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePageAdmin()),
    );
  }

  void navigateToAdminCarListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminCustomerCarsList()),
    );
  }

  void navigateToAdminCustomerListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminCustomersList()),
    );
  }

  void navigateToAdminCardealerListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminCarDealersList()),
    );
  }

  void navigateToAdminReservationListPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminReservationsList()),
    );
  }

// Function to handle navigation based on the index
  void navigateByIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        navigateToHomePageCustomer(context);
        break;
      case 1:
        navigateToFavoritCustomerPage(context);

        break;
      case 2:
        navigateToViewProfile(context);
        break;
    }
  }
}
