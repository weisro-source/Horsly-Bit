import 'package:flutter/material.dart';
import 'package:horsly_bit/core/assets_path/image_path.dart';

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.imagesBackground),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
