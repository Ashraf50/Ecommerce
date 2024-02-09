import 'package:Ecommerce/core/utils/colors.dart';
import 'package:flutter/material.dart';

class IconButtonCamera extends StatelessWidget {
  final void Function()? choosePhoto;
  final void Function()? takePhoto;
  const IconButtonCamera({
    super.key,
    required this.choosePhoto,
    required this.takePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: AppColors.secondaryColor,
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    TextButton(
                      title: "Choose photo",
                      onTap: choosePhoto,
                    ),
                    TextButton(
                      title: "Take photo",
                      onTap: takePhoto,
                    ),
                    TextButton(
                      title: "Cancel",
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      icon: const Icon(
        Icons.add_a_photo,
        color: Color.fromARGB(173, 0, 0, 0),
      ),
    );
  }
}

class TextButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const TextButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
