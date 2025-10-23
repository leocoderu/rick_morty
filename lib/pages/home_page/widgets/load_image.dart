import 'package:flutter/material.dart';

class LoadImage extends StatelessWidget {
  const LoadImage({super.key, this.path});

  final String? path;

  @override
  Widget build(BuildContext context) {
    return (path != null )
      ? Image.network(
          path!,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              // Картинка полностью загружена
              return child;
            }
            // Пока грузится — показываем индикатор
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        )
      : Image.asset('assets/system/images/no_photo.jpg');
  }
}
