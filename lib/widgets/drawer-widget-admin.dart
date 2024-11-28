// ignore_for_file: file_names, sort_child_properties_last, prefer_const_constructors, unused_local_variable, must_be_immutable, avoid_print, unnecessary_string_interpolations, deprecated_member_use, unused_element, unnecessary_null_comparison
import 'package:admin_panel/const/app-colors.dart';
import 'package:admin_panel/screens/admin-profile.dart';
import 'package:admin_panel/screens/admin-screen.dart';
import 'package:admin_panel/screens/all-users-screen.dart';
import 'package:admin_panel/screens/manage-users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/all-orders-screen.dart';
import '../screens/all-products-screen.dart';
import '../screens/all_categories_screen.dart';
import '../screens/main-screen.dart';
import '../screens/select-type.dart';
import '../utils/constant.dart';

class DrawerAdminWidget extends StatefulWidget {
  const DrawerAdminWidget({
    super.key,
  });

  @override
  State<DrawerAdminWidget> createState() => _DrawerAdminWidgetState();
}

class _DrawerAdminWidgetState extends State<DrawerAdminWidget> {
  User? user = FirebaseAuth.instance.currentUser;
  AppConstant constant = AppConstant();
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final GoogleSignInController googleSignInController =
  //     Get.put(GoogleSignInController());

  String userName = 'Admin';
  String firstLetter = 'Rahat';

  // Future<dynamic> getUserData() async {
  //   if (user != null) {
  //     final DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user!.uid.toString())
  //         .get();

  //     UserModel userModel =
  //         UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
  //     userName = userModel.username;
  //     firstLetter = userModel.username[0];
  //     setState(() {});

  //     print(userName);
  //   } else {}
  // }

  @override
  void initState() {
    super.initState();

    // if (user != null) {
    //   getUserData();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        )),
        child: Wrap(
          runSpacing: 10,
          children: [
            user != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    child: ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Text(
                        userName.toString(),
                        style: TextStyle(color: AppConstant.colorWhite),
                      ),
                      subtitle: Text(
                        AppConstant.appVersion,
                        style: TextStyle(color: Colors.grey),
                      ),
                      leading: CircleAvatar(
                        radius: 24.0,
                        backgroundColor: AppConstant.colorWhite,
                        child: Text(
                          firstLetter,
                          style: TextStyle(color: AppConstant.colorRed),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    child: ListTile(
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Text(
                        "Guest",
                        style: TextStyle(color: AppConstant.colorWhite),
                      ),
                      subtitle: Text(
                        AppConstant.appVersion,
                        style: TextStyle(color: Colors.grey),
                      ),
                      leading: CircleAvatar(
                        radius: 22.0,
                        backgroundColor: AppConstant.colorRed,
                        child: Text(
                          "G",
                          style: TextStyle(color: AppConstant.colorWhite),
                        ),
                      ),
                    ),
                  ),
            Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                  Get.offAll(() => AdminScreen());
                },
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                  Get.offAll(() => ManageUsers());
                },
                title: Text(
                  'Manage Account',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                  Get.to(() => AllUsersScreen());
                },
                title: Text(
                  'Users',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                  Get.to(() => AllOrdersScreen());
                },
                title: Text(
                  'Orders',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () {
                  Get.back();
                  Get.to(() => AllProductsScreen());
                },
                title: Text(
                  'Products',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.production_quantity_limits,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                onTap: () async {
                  Get.back();

                  Get.to(() => AllCategoriesScreen());
                },
                title: Text(
                  'Categories',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  Icons.category,
                  color: Colors.white,
                ),
              ),
            ),
            if (user != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () {
                    // Get.back();
                    Get.offAll(AdminProfileScreen());
                  },
                  title: Text(
                    'Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.reviews_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () async {
                  if (user != null) {
                    EasyLoading.show();
                    await FirebaseAuth.instance.signOut();
                    // await _googleSignIn.signOut();
                    Get.offAll(() => SelectTypeScreen());
                    EasyLoading.dismiss();
                  } else {
                    Get.back();
                    // await googleSignInController.signInWithGoogle();
                  }
                },
                title: Text(
                  user != null ? 'Logout' : 'Login',
                  style: TextStyle(color: Colors.white),
                ),
                leading: Icon(
                  user != null ? Icons.logout : Icons.login,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        width: Get.width - 80.0,
        backgroundColor: AppColor().colorRed,
        // backgroundColor: Colors.grey.shade900,
      ),
    );
  }

  // send whatsapp message
  
}
