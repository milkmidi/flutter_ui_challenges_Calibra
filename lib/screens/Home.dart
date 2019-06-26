import 'package:calibra/components/MyBalance.dart';
import 'package:calibra/components/UserCard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageController = PageController(viewportFraction: 0.8);
  int currentPageViewItem = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: pageController,
            itemBuilder: (BuildContext context, int index) {
              bool active = currentPageViewItem == index;
              return Align(child: UserCard(index: index, active: active, onTap: _onItemTap));
            },
            itemCount: 10,
            onPageChanged: (int index) {
              if (currentPageViewItem != index) {
                setState(() {
                  currentPageViewItem = index;
                  print('currentPageViewItem:' + currentPageViewItem.toString());
                });
              }
            },
          ),
        ),
        Container(width: double.infinity, child: MyBalance()),
      ],
    );
  }
  void _onItemTap(int index){
    print('$index');
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
