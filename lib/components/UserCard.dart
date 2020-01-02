import 'package:calibra/screens/CalculatePage.dart';
import 'package:calibra/utils/config.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final int index;
  final bool active;
  final Function onTap;
  UserCard({this.index, this.active, this.onTap});

  /* Widget _customFlightShuttleBuilder(
      BuildContext flightContext,
      Animation<double> animation,
      HeroFlightDirection flightDirection,
      BuildContext fromHeroContext,
      BuildContext toHeroContext) {
    final Hero toHero = toHeroContext.widget;
    return FadeTransition(
      opacity: animation,
      child: toHero.child,
    );
  } */

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color color = getColor(index);

    final pHeight = size.height * 0.6;
    double height = active ? pHeight : pHeight - 50;

    return AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.all(20),
        height: height,
        child: Column(
          children: <Widget>[
            Hero(
              tag: "CardTop_$index",
              // flightShuttleBuilder: _customFlightShuttleBuilder,
              child: Container(
                width: size.width * 0.6,
                height: 20,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 8,
                margin: EdgeInsets.only(top: 0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Hero(
                          tag: "img$index",
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000.0),
                            child: Image.network(
                              'https://picsum.photos/id/$index/200/200',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('milkmidi'),
                      Text(
                        (index * 20).toString() + '.20',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: color),
                      ),
                      Text('USD'),
                      Text('Yesterday at 3:55 PM'),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                                elevation: 0,
                                child: Text('View'),
                                color: Color(0xfff5f6fa),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                onPressed: () {
                                  onTap(index);
                                  _navigatorToCalculatePage(
                                      context, index, color);
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void _navigatorToCalculatePage(BuildContext context, int index, Color color) {
    print('_navigatorToCalculatePage:' + index.toString());
    Widget page = CalculatePage(index: index, color: color);
    // Navigator.push(context, _buildCustomPageRoute(page));
    Navigator.push(context, buildMaterialPageRoute(page));
  }

  Route buildMaterialPageRoute(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }

  Route _buildCustomPageRoute(Widget page) {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            page,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return FadeTransition(opacity: animation, child: child);
          /* return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0.0, 1.0),
                            end: Offset.zero,
                          ).animate(animation),
                          // child:child,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset.zero,
                              end: const Offset(0.0, 1.0),
                            ).animate(secondaryAnimation),
                            child: child,
                          ),
                        ); */
        },
        transitionDuration: const Duration(milliseconds: 2000));
  }
}
