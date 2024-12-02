import 'package:eye_care/Core/themes/styles.dart';
import 'package:eye_care/Features/Home/Ui/widgets/home_body.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload Eye rays",
          style: TextStyles.font24BlackBold,
        ),
      ),
      body: const HomeBody(),
    );
  }
}
