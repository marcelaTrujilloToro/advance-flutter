// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:disenos/src/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            const PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final show = Provider.of<_MenuModel>(context).show;

    return Positioned(
      bottom: 30,
      child: SizedBox(
        width: screenWidth,
        child: Align(
          child: PinterestMenu(
            show: show,
            backgroundColor: Colors.grey.shade300,
            activeColor: Colors.blue.shade700,
            // inactiveColor: Colors.lightBlue,
            items: [
              PinterestButton(
                onPressed: () {
                  print('Icon pie_chart');
                },
                icon: Icons.pie_chart_rounded,
              ),
              PinterestButton(
                onPressed: () {
                  print('search');
                },
                icon: Icons.search_rounded,
              ),
              PinterestButton(
                onPressed: () {
                  print('noti');
                },
                icon: Icons.notifications_rounded,
              ),
              PinterestButton(
                onPressed: () {
                  print('user');
                },
                icon: Icons.supervised_user_circle_rounded,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({super.key});

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List items = List.generate(200, (index) => index);

  ScrollController controller = ScrollController();
  double scrollPrev = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollPrev && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }
      scrollPrev = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.blue.shade200,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          )),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => _show;

  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}
