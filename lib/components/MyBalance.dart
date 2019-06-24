import 'package:flutter/material.dart';

class MyBalance extends StatelessWidget {
  const MyBalance({Key key}) : super(key: key);

  Widget _buildButton(String text) {
    return Expanded(
      child: RaisedButton(
          color: Color(0xff5645f5),
          onPressed: () {
            print('onPress');
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(30.0),
            topRight: const Radius.circular(30.0),
          )),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'My Balance',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Text('199.20',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('USD 171.25'),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              _buildButton('Request'),
              SizedBox(width: 20),
              _buildButton('Send')
            ],
          )
        ],
      ),
    );
  }
}
