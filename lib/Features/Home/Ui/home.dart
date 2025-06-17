import 'package:cached_network_image/cached_network_image.dart';
import 'package:eye_care/Core/helpers/cach_helper.dart';
import 'package:eye_care/Core/helpers/constants.dart';
import 'package:eye_care/Core/helpers/extensions.dart';
import 'package:eye_care/Core/helpers/shared_key.dart';
import 'package:eye_care/Core/networking/dio_factory.dart';
import 'package:eye_care/Core/routing/routes.dart';
import 'package:eye_care/Core/themes/colors.dart';
import 'package:eye_care/Core/themes/styles.dart';
import 'package:eye_care/Features/Home/Logic/cubit/home_cubit.dart';
import 'package:eye_care/Features/Home/Ui/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<HomeCubit>().scaffoldKey,
      drawer: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        child: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "abo helmy",
                  style: TextStyles.font16WhiteSemiBold,
                ),
                accountEmail: Text(
                  "bombo@gmail.com",
                  style: TextStyles.font16WhiteSemiBold,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://www.facebook.com/photo/?fbid=3689449764642082&set=a.1380925518827863",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Center(
                        child: Text("AH", style: TextStyles.font18BlackBold),
                      ),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                // currentAccountPicture: CircleAvatar(
                //   backgroundImage: NetworkImage(
                //     "https://example.com/profile.jpg",
                //   ),
                //   child: Text("JD", style: TextStyles.font18BlackBold),
                // ),
                decoration: BoxDecoration(color: ColorsManager.mainColor),
              ),
              ListTile(
                // leading: Icon(Icons.account_box_outlined),
                title: Text('Account'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                // leading: Icon(Icons.settings),
                title: Text('About us'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                // leading: Icon(Icons.home),
                title: Text('Team'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                // leading: Icon(Icons.settings),
                title: Text('protection'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                // leading: Icon(Icons.home),
                title: Text('Terms & condition'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                // leading: Icon(Icons.settings),
                title: Text('privacy'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Logout'),
                onTap: () async {
                  await CachHelper.clearAllSecuredData();
                  AppConstants.isLogged = false;
                  DioFactory.setTokenAfterLogin(null);
                  context.pushNamedAndRemoveUntill(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
      body: HomeBody(),
    );
  }
}
// // import 'package:eye_care/Core/themes/styles.dart';
// import 'package:eye_care/Features/Home/Logic/cubit/home_cubit.dart';
// import 'package:eye_care/Features/Home/Ui/widgets/home_body.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: context.read<HomeCubit>().scaffoldKey,
//       drawer: Drawer(
//         // Your drawer content here
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(color: Colors.blue),
//               child: Text('Drawer Header'),
//             ),
//             ListTile(
//               title: Text('Item 1'),
//               onTap: () {
//                 // Update the state of the app
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: Text('Item 2'),
//               onTap: () {
//                 // Update the state of the app
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       // appBar: AppBar(
//       //   title: Text(
//       //     "Upload Eye rays",
//       //     style: TextStyles.font24BlackBold,
//       //   ),
//       // ),
//       body: HomeBody(),
//     );
//   }
// }
