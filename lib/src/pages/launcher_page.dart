// ignore_for_file: avoid_unnecessary_containers

import 'package:disenos/src/theme/theme_changer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos/src/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diseños de Flutter'),
      ),
      body: _ListOptions(),
      drawer: _PrincipalMenu(),
    );
  }
}

class _ListOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        color: appTheme.colorScheme.secondary,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(
          pageRoutes[index].icon,
          color: appTheme.primaryColor,
        ),
        title: Text(pageRoutes[index].title),
        trailing: Icon(
          Icons.chevron_right,
          color: appTheme.primaryColor,
        ),
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => pageRoutes[index].page,
              ));
        },
      ),
    );
  }
}

class _PrincipalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    final accentColor = appTheme.currentTheme.primaryColor;

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: const Text(
                    'MT',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),

            //
            Expanded(child: _ListOptions()),

            //
            ListTile(
              leading: Icon(
                Icons.lightbulb_rounded,
                color: appTheme.currentTheme.primaryColor,
              ),
              title: const Text('Dark mode'),
              trailing: Switch.adaptive(
                activeColor: accentColor,
                value: appTheme.darkTheme,
                onChanged: (value) {
                  appTheme.darkTheme = value;
                },
              ),
            ),

            //
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen_rounded,
                  color: accentColor,
                ),
                title: const Text('Custom theme'),
                trailing: Switch.adaptive(
                  activeColor: accentColor,
                  value: appTheme.customTheme,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
