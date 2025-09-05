import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spendwise/features/auth/data/models/user_model.dart';
import 'package:spendwise/features/settings/data/repos/settings_repo.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._settingsRepo) : super(UpdateProfileInitial());

  final SettingsRepo _settingsRepo;

  Future<void> updateProfile({required UserModel user}) async {
    final result = await _settingsRepo.updateProfile(user: user);
    result.fold(
      (failure) => emit(UpdateProfileFailure(errMessage: failure.message)),
      (success) => emit(UpdateProfileSuccess()),
    );
  }

  void pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(
      source: source,
      imageQuality: 100,
      maxWidth: 150,
    );

    if (pickedImage == null) {
      return;
    }

    emit(ImagePicked(pickedImageFile: File(pickedImage.path)));
  }
}
