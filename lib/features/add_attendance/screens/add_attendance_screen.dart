import 'package:alex_bank_core_team_app/shared/components/custom_app_bar.dart';
import 'package:alex_bank_core_team_app/shared/components/custom_elevated_button.dart';
import 'package:alex_bank_core_team_app/shared/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddAttendanceScreen extends StatefulWidget {
  const AddAttendanceScreen({super.key});

  @override
  State<AddAttendanceScreen> createState() => _AddAttendanceScreenState();
}

class _AddAttendanceScreenState extends State<AddAttendanceScreen> {
  String selectedStatus = "Work From Home";

  final List<Map<String, dynamic>> workTypes = [
    {
      "title": "Work From Home",
      "icon": Icons.home_work_rounded,
      "color": const Color(0xFF4DA3FF),
      "bg": const Color(0xFF4DA3FF).withOpacity(0.15),
    },
    {
      "title": "Work From Office",
      "icon": Icons.apartment_rounded,
      "color": const Color(0xFF31D67B),
      "bg": const Color(0xFF31D67B).withOpacity(0.15),
    },
    {
      "title": "Work From Other Office",
      "icon": Icons.location_city_rounded,
      "color": const Color(0xFFFF962D),
      "bg": const Color(0xFFFF962D).withOpacity(0.15),
    },
    {
      "title": "Holiday",
      "icon": Icons.beach_access_rounded,
      "color": const Color(0xFFFF4DA6),
      "bg": const Color(0xFFFF4DA6).withOpacity(0.15),
    },
  ];

  void showWorkStatusDialog(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.4),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 24,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF0C1325) : Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: isDark
                        ? Colors.white.withOpacity(0.05)
                        : Colors.grey.withOpacity(0.08),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? Colors.black.withOpacity(0.25)
                          : Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 20),
                        child: Text(
                          "Select Work Status",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: isDark
                                ? Colors.white
                                : const Color(0xFF1C1C33),
                          ),
                        ),
                      ),

                      /// STATUS LIST
                      ...List.generate(workTypes.length, (index) {
                        final item = workTypes[index];

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 24,
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: () {
                                  setState(() {
                                    selectedStatus = item['title'];
                                  });

                                  setStateDialog(() {});

                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 58,
                                      width: 58,
                                      decoration: BoxDecoration(
                                        color: item['bg'],
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Icon(
                                        item['icon'],
                                        color: item['color'],
                                        size: 30,
                                      ),
                                    ),

                                    const SizedBox(width: 18),

                                    Expanded(
                                      child: Text(
                                        item['title'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: isDark
                                              ? Colors.white
                                              : const Color(0xFF1C1C33),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            if (index != workTypes.length - 1)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Divider(
                                  height: 1,
                                  color: isDark
                                      ? Colors.white.withOpacity(0.08)
                                      : Colors.grey.withOpacity(0.15),
                                ),
                              ),
                          ],
                        );
                      }),

                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF050B1A)
          : const Color(0xFFF6F6FA),
      appBar: getCustomAppBar(
        context,
        title: "Add",
        primaryColorTitle: "Attendance",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 10),

              /// SELECT DATE
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Date",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF6C63FF),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              CustomTextFormField(
                isEnabled: false,
                hint: 'Select a Date',
                prefixIcon: Icons.calendar_month_outlined,
                isDark: isDark,
              ),

              const SizedBox(height: 38),

              /// WORK STATUS
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Work Status",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF6C63FF),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              InkWell(
                onTap: () => showWorkStatusDialog(context),
                child: CustomTextFormField(
                  isEnabled: false,
                  hint: 'Select Work Status',
                  suffixIcon: Icons.keyboard_arrow_down_rounded,
                  isDark: isDark,
                  prefixIcon: Icons.work_outline_rounded,
                ),
              ),

              const Spacer(),

              CustomElevatedButton(title: "Save Attendance", onTap: () {}),

              SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
