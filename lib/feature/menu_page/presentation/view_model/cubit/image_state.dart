part of 'image_cubit.dart';

sealed class ImageState {}

final class ImageInitial extends ImageState {}

final class ImageLoadingSuccess extends ImageState {}

final class ImageLoadingFailure extends ImageState {

}
