part of 'update_profile_cubit.dart';

sealed class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

final class UpdateProfileInitial extends UpdateProfileState {}

final class UpdateProfileLoading extends UpdateProfileState {}

final class UpdateProfileSuccess extends UpdateProfileState {
  final User user;

  const UpdateProfileSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

final class UpdateProfileFailure extends UpdateProfileState {
  final String errMessage;

  const UpdateProfileFailure({required this.errMessage});
}

final class ImagePicked extends UpdateProfileState {
  final File pickedImageFile;

  const ImagePicked({required this.pickedImageFile});
}
