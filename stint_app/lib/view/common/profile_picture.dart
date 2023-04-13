import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final double radius;
  final String imgURL;
  final bool includeEdit;
  final void Function()? onTap;
  const ProfilePicture(
      {super.key,
      required this.imgURL,
      required this.radius,
      this.onTap,
      required this.includeEdit});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: radius,
              backgroundImage: AssetImage(imgURL),
            ),
          ),
          if (includeEdit)
            Positioned(
              bottom: 8,
              right: 8,
              child: InkWell(
                onTap: onTap,
                child: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
