import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pennysmart/widgets/CustomFloatingActionButton.dart';
import 'package:pennysmart/widgets/appbar/appbar_actions.dart';
import 'package:pennysmart/widgets/page_toggles.dart';
import 'package:pennysmart/constants/homepage.dart';

class HomePagParentView extends StatefulWidget {
  static String name = "home_page_view";

  const HomePagParentView({super.key});

  @override
  State<HomePagParentView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePagParentView> {
  void changePage(String name) {
    setState(() {
      selectedPage = name;
    });
  }

  String selectedPage = "Notes";

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    bool auth = user != null;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            titleTextStyle: TextStyle(),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade400,
                  ),
                ),
                Text(
                  auth
                      ? user.displayName!.length > 25
                          ? "${user.displayName!.substring(0, 15)}..."
                          : user.displayName ?? ""
                      : "Dear User",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade900,
                  ),
                ),
              ],
            ),
            actions: const [AppBarActions()],
          ),
        ),
        extendBody: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Non-scrollable section for the page toggles
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: PageToggles(
                pages: Homepage.pages,
                changePage: changePage,
                selectedPage: selectedPage,
              ),
            ),

            // Scrollable section for the page content
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Homepage.pages[selectedPage] as Widget,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: const Customfloatingactionbutton(),
      ),
    );
  }
}
