import 'package:Ecommerce/core/utils/colors.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view/widget/camera_icon_button.dart';
import 'package:Ecommerce/core/widgets/photo_view.dart';
import 'package:Ecommerce/feature/menu_page/presentation/view_model/cubit/image_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CustomPhoto extends StatelessWidget {
  const CustomPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        var cubit = ImageCubit.get(context);
        return FutureBuilder<DocumentSnapshot>(
          future: cubit.users.doc(cubit.userDetails!.uid).get(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }
            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("Document does not exist");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(
                      children: [
                        cubit.imgPath == null
                            ? data["imgLink"] == null
                                ? CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    maxRadius: 60,
                                    backgroundImage: const AssetImage(
                                      "assets/avatar.png",
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.primaryColor,
                                        )),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(
                                          PhotoViewer(image: data["imgLink"]),
                                        );
                                      },
                                      child: CircleAvatar(
                                        maxRadius: 80,
                                        backgroundImage:
                                            NetworkImage(data["imgLink"]),
                                      ),
                                    ),
                                  )
                            : Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 2,
                                      color: AppColors.primaryColor,
                                    )),
                                child: ClipOval(
                                    child: Image.file(
                                  cubit.imgPath!,
                                  height: 145,
                                  width: 145,
                                  fit: BoxFit.cover,
                                )),
                              ),
                        Positioned(
                          bottom: -5,
                          right: -5,
                          child: IconButtonCamera(
                            choosePhoto: () {
                              cubit.choosePhoto();
                              Navigator.pop(context);
                            },
                            takePhoto: () {
                              cubit.takePhoto();
                              Navigator.pop(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${data["username"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            } else {
              return Shimmer.fromColors(
                baseColor: AppColors.grey,
                highlightColor: AppColors.secondaryColor,
                child: const CircleAvatar(
                  maxRadius: 80,
                ),
              );
            }
          },
        );
      },
    );
  }
}
