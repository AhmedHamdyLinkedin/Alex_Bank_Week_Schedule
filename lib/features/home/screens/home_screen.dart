// ignore_for_file: deprecated_member_use

import 'package:alex_bank_core_team_app/components/bottom_nav_bar.dart';
import 'package:alex_bank_core_team_app/components/custom_app_bar.dart';
import 'package:alex_bank_core_team_app/features/home/widgets/date_card.dart';
import 'package:alex_bank_core_team_app/features/home/widgets/tab_view_widget.dart';
import 'package:alex_bank_core_team_app/features/home/widgets/work_type_card.dart';
import 'package:alex_bank_core_team_app/models/employee_model.dart';
import 'package:alex_bank_core_team_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

final List<EmployeeModel> officeEmployees = [
  EmployeeModel(
    name: "Alex Morgan",
    icl: "ICL00123",
    image: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
  ),
  EmployeeModel(
    name: "Sophia Taylor",
    icl: "ICL00145",
    image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
  ),
  EmployeeModel(
    name: "James Wilson",
    icl: "ICL00167",
    image: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d",
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> workTypes = const [
    'Work From Home',
    'Work From Office',
    'Work From Other Office',
    'Holiday',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = themeController.isDark;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: getCustomAppBar(
          context,
          title: "Home",
          primaryColorTitle: "",
          actions: [
            //-> THEME TOGGLE BUTTON <-
            CircleAvatar(
              radius: 22,
              backgroundColor: theme.cardColor,
              child: IconButton(
                onPressed: () {
                  themeController.toggleTheme();
                },
                icon: Icon(
                  isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),

            //-> ADD BUTTON <-
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primary.withOpacity(0.7),
                  ],
                ),
              ),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: theme.colorScheme.primary,
          onPressed: () {},
          icon: const Icon(Icons.description_outlined, color: Colors.white),
          label: const Text(
            'Details',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),

        //-> BOTTOM NAVIGATION BAR <-
        bottomNavigationBar: BottomNavBar(),

        //-> BODY <-
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                //-> TAB BAR <-
                TabViewWidget(
                  tabTitles: const ['Today', 'Tomorrow', 'Schedule'],
                  onTapSelect: (selectedTab) {
                    // Handle tab selection
                  },
                  margin: EdgeInsets.only(bottom: 20),
                ),

                //-> DATE CARD <-
                DateCard(
                  date: DateTime.now(),
                  margin: EdgeInsets.only(bottom: 18),
                ),
                //-> CONTENT <-
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: workTypes
                          .map(
                            (workType) => WorkTypeCard(
                              title: 'Work From Office',
                              subtitle: '12 Employees',
                              icon: Icons.business_rounded,
                              color: Colors.green,
                              employees: officeEmployees,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
