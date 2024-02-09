import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' show basename;
part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());
  static ImageCubit get(context) => BlocProvider.of(context);
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  final userDetails = FirebaseAuth.instance.currentUser;
  File? imgPath;
  String? imgName;
  uploadImage(ImageSource cameraOrGallery) async {
    final pickedImg = await ImagePicker().pickImage(source: cameraOrGallery);
    try {
      if (pickedImg != null) {
        imgPath = File(pickedImg.path);
        imgName = basename(pickedImg.path);
        int random = Random().nextInt(9999999);
        imgName = "$random$imgName";
        emit(ImageLoadingSuccess());
      } else {
        emit(ImageLoadingFailure());
      }
    } catch (e) {
      print("Error => $e");
    }
  }

  choosePhoto() async {
    await uploadImage(ImageSource.gallery);
    if (imgPath != null) {
      final storageRef = FirebaseStorage.instance.ref(imgName);
      await storageRef.putFile(imgPath!);
      String url = await storageRef.getDownloadURL();
      users.doc(userDetails!.uid).update(
        {
          "imgLink": url,
        },
      );
    }
  }

  takePhoto() async {
    await uploadImage(ImageSource.camera);
    if (imgPath != null) {
      final storageRef = FirebaseStorage.instance.ref(imgName);
      await storageRef.putFile(imgPath!);
      String url = await storageRef.getDownloadURL();
      users.doc(userDetails!.uid).update(
        {
          "imgLink": url,
        },
      );
    }
  }
}
