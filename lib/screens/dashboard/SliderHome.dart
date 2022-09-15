import 'package:flutter/material.dart';
import 'package:hello_world/screens/dashboard/Conversor.dart';

class SliderHome extends StatefulWidget {
  @override
  _SliderHomeState createState() => _SliderHomeState();
}

class _SliderHomeState extends State<SliderHome> {
  PageController controller = PageController();

  final messages = ["", "", ""];
  final images = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png'
  ];

  int numberOfPages = 3;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: numberOfPages,
            itemBuilder: (BuildContext context, int index) {
              return EachPage(messages[index], images[index]);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(child: Container()),
                  Flexible(
                    child: Indicator(
                      controller: controller,
                      pageCount: 3,
                    ),
                  ),
                  Flexible(
                    child: (currentPage == numberOfPages - 1)
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Conversor()));
                            },
                            child: Center(
                                child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Conversor()));
                              },
                              child: Text("Converter!",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            )))
                        : GestureDetector(
                            onTap: () {
                              controller.jumpToPage(numberOfPages - 1);
                            },
                            child: Center(
                                child: Text(
                              "Pular",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EachPage extends StatelessWidget {
  final String message;
  final String image;

  EachPage(this.message, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 85, 49, 248),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                image,
                fit: BoxFit.fill,
                width: 400,
                height: 800,
              ),
              Text(message)
            ],
          ),
        ),
      ),
    );
  }
}

class Indicator extends AnimatedWidget {
  final PageController controller;
  final int pageCount;
  const Indicator({required this.controller, required this.pageCount})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              itemCount: pageCount,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _createIndicator(index);
              })
        ],
      ),
    );
  }

  Widget _createIndicator(index) {
    double w = 10;
    double h = 10;
    MaterialColor color = Colors.blue;

    if (controller.page == index) {
      color = Colors.purple;
      h = 16;
      w = 16;
    }

    return Container(
      height: 30,
      width: 30,
      child: Center(
        child: AnimatedContainer(
          margin: EdgeInsets.all(5),
          color: color,
          width: w,
          height: h,
          duration: Duration(milliseconds: 50),
        ),
      ),
    );
  }
}
