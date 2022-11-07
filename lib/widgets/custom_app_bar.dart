import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:house_rent/screens/auth/pages/login_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _handleNavigateToLogin(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/menu.svg'),
            ),
            IconButton(
                onPressed: () {
                  _handleNavigateToLogin(context);
                },
                icon: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.jpeg'),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
