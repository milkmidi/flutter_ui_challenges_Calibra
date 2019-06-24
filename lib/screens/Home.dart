import 'package:calibra/components/MyBalance.dart';
import 'package:calibra/components/UserCard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageController = PageController(viewportFraction: 0.8);

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
              return _buildPage(context, index);
            },
            itemCount: 10,
          ),
        ),
        Container(width: double.infinity, child: MyBalance()),
      ],
    );
  }

  Widget _buildPage(BuildContext context, int index) {
    return Align(child: UserCard());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
