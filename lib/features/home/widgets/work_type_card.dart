// ignore_for_file: deprecated_member_use

import 'package:alex_bank_core_team_app/features/home/widgets/enployee_card.dart';
import 'package:alex_bank_core_team_app/shared/models/employee_model.dart';
import 'package:flutter/material.dart';

class WorkTypeCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color color;
  final List<EmployeeModel> employees;
  final bool showAsStackOfImages;

  const WorkTypeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.employees,
    this.showAsStackOfImages = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///
              /// ICON
              ///
              Container(
                height: 62,
                width: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color.withOpacity(0.15),
                ),
                child: Icon(icon, color: color, size: 30),
              ),

              const SizedBox(width: 18),

              //-> CONTENT <-
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Visibility(
                      visible: subtitle != null,
                      child: Text(
                        '$subtitle',
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    //-> EMPLOYEE IMAGES <-
                    Visibility(
                      visible: showAsStackOfImages,
                      child: SizedBox(
                        height: 40,
                        child: Stack(
                          children: List.generate(employees.length, (index) {
                            return Positioned(
                              left: index * 20,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 21,
                                  backgroundColor: Colors.white,
                                  backgroundImage: NetworkImage(
                                    employees[index].image,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (!showAsStackOfImages)
            ...employees.map((e) => EmployeeCard(employee: e)),
        ],
      ),
    );
  }
}
