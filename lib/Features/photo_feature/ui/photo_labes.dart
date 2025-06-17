import 'package:eye_care/Features/photo_feature/ui/widgets/photo_labes_body.dart';
import 'package:flutter/material.dart';

class PhotoLabes extends StatelessWidget {
  const PhotoLabes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PhotoLabesBody(),
      ),
    );
  }
}
