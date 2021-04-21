import 'package:flutter/material.dart';
import 'package:flutter_app/src/config/app_route.dart';
import 'package:flutter_app/src/constants/app_setting.dart';
import 'package:flutter_app/src/shared/background_theme.dart';
import 'package:flutter_app/src/view_models/menu_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Singh'),
            accountEmail: Text('Singh@gmail.com'),
            currentAccountPicture: CircleAvatar(
              // เรียกจาก assets
              // backgroundImage: AssetImage(
              //   'assets/images/cdgs_logo.png'
              // ),
              // เรียกจาก network
              backgroundImage: NetworkImage(
                  'https://c.files.bbci.co.uk/12A9B/production/_111434467_gettyimages-1143489763.jpg'),
            ),
            decoration: BoxDecoration(gradient: BackGroundTheme.gradient),
          ),
          ...MenuViewModel()
              .items
              .map((item) => ListTile(
            onTap: () {
              item.onTap(context);
            },
            leading: Icon(
              item.icon,
              color: item.iconColor,
            ),
            title: Text(item.title),
          ))
              .toList(),
          Spacer(), // การดันไปล้างสุด หรือบนสุด
          ListTile(
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.remove(AppSetting.tokenSetting);
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.loginRoute, (route) => false);
            },
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
          )
        ],
      ),
    );
  }
}