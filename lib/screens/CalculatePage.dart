import 'package:flutter/material.dart';

class CalculatePage extends StatefulWidget {
  final int index;
  final Color color;
  CalculatePage({this.index, this.color});

  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage>
    with TickerProviderStateMixin {
  // bool _visible = true;
  AnimationController _controller;
  Animation _tween;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    _tween = Tween(begin: 100.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: "CardTop_${widget.index}",
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color: widget.color,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
            SizedBox(height: 50),
            /* AnimatedOpacity(
                  opacity: _visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black),
                    height: 50,
                  ),
                ), */

            Align(
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Text('hi, ${widget.index} ${_tween.value}'),
              ),
            ),
            Hero(
              tag: "img${widget.index}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000.0),
                child: Image.network(
                  'https://picsum.photos/id/${widget.index}/200/200',
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
