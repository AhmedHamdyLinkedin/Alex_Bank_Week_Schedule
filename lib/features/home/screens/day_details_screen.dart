import 'package:alex_bank_core_team_app/components/custom_app_bar.dart';
import 'package:alex_bank_core_team_app/features/home/widgets/date_card.dart';
import 'package:alex_bank_core_team_app/features/home/widgets/tab_view_widget.dart';
import 'package:alex_bank_core_team_app/features/home/widgets/work_type_card.dart';
import 'package:alex_bank_core_team_app/models/employee_model.dart';
import 'package:flutter/material.dart';

class DayDetailsScreen extends StatefulWidget {
  const DayDetailsScreen({super.key});

  @override
  State<DayDetailsScreen> createState() => _DayDetailsScreenState();
}

class _DayDetailsScreenState extends State<DayDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

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

  final List<EmployeeModel> homeEmployees = [
    EmployeeModel(
      name: "Emily Davis",
      icl: "ICL00211",
      image: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80",
    ),
    EmployeeModel(
      name: "Daniel Martinez",
      icl: "ICL00232",
      image: "https://images.unsplash.com/photo-1504593811423-6dd665756598",
    ),
  ];

  final List<EmployeeModel> holidayEmployees = [
    EmployeeModel(
      name: "Benjamin Lee",
      icl: "ICL00367",
      image: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
    ),
    EmployeeModel(
      name: "Charlotte White",
      icl: "ICL00388",
      image: "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
    ),
  ];

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: getCustomAppBar(
          context,
          title: "Day ",
          primaryColorTitle: "Details",
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.025),
                //-> TAB BAR <-
                TabViewWidget(
                  tabTitles: const ['All', 'Office', 'Home', 'Holiday'],
                  onTapSelect: (selectedTab) {
                    // Handle tab selection
                  },
                  margin: EdgeInsets.only(bottom: 20),
                ),
                DateCard(
                  date: DateTime.now(),
                  margin: EdgeInsets.only(bottom: size.height * 0.02),
                ),

                /// CONTENT
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      WorkTypeCard(
                        showAsStackOfImages: false,
                        title: "Work From Office",
                        subtitle: "12 Employees",
                        icon: Icons.apartment_rounded,
                        color: Colors.green,
                        employees: officeEmployees,
                      ),

                      WorkTypeCard(
                        showAsStackOfImages: false,
                        title: "Work From Home",
                        subtitle: "8 Employees",
                        icon: Icons.home_rounded,
                        color: Colors.blue,
                        employees: homeEmployees,
                      ),

                      WorkTypeCard(
                        showAsStackOfImages: false,
                        title: "Holiday",
                        subtitle: "6 Employees",
                        icon: Icons.beach_access_rounded,
                        color: Colors.pink,
                        employees: holidayEmployees,
                      ),
                    ],
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
