import 'package:Ecommerce/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Icon icon;
  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    icon,
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
