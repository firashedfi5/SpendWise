import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spendwise/core/utils/assets.dart';
import 'package:spendwise/core/utils/service_locator.dart';
import 'package:spendwise/features/settings/presentation/manager/update_profile_cubit/update_profile_cubit.dart';

class ProfilImage extends StatelessWidget {
  const ProfilImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        File? pickedImageFile;
        if (state is ImagePicked) {
          pickedImageFile = state.pickedImageFile;
        }
        return Column(
          children: [
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.grey,
              foregroundImage: pickedImageFile != null
                  ? FileImage(pickedImageFile)
                  : getIt.get<FirebaseAuth>().currentUser?.photoURL != null
                  ? CachedNetworkImageProvider(
                      getIt.get<FirebaseAuth>().currentUser!.photoURL!,
                    )
                  : const AssetImage(AssetsData.defaultAvatar),
            ),
            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (ctx) => Wrap(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.camera_alt),
                      title: const Text('Take a Picture'),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        context.read<UpdateProfileCubit>().pickImage(
                          ImageSource.camera,
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.image),
                      title: const Text('Choose from Gallery'),
                      onTap: () {
                        Navigator.of(ctx).pop();
                        context.read<UpdateProfileCubit>().pickImage(
                          ImageSource.gallery,
                        );
                      },
                    ),
                  ],
                ),
              ),
              icon: const Icon(Icons.image),
              label: const Text('Changer la photo'),
            ),
          ],
        );
      },
    );
  }
}
