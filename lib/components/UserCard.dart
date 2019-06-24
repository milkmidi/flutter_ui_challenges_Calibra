import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        // padding: EdgeInsets.only(top: 20),
        margin: EdgeInsets.all(20),
        // width: size.width,
        height: size.height * 0.6,
        child: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: -15,
              width: size.width * 0.6 - 20,
              height: 100,
              left: 30,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff5645f5),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            Card(
              elevation: 8,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(1000.0),
                        child: Image.network('https://fakeimg.pl/100x100/')),
                    SizedBox(height: 10),
                    Text('milkmidi'),
                    Text(
                      '158.20',
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffff8a94)),
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
                                borderRadius: new BorderRadius.circular(30.0)),
                            onPressed: () {
                              print('Pressed');
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
