import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(36, 35, 35, 1),
      height: 600,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          InkWell(
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              height: 50,
              width: 70,
              child: SizedBox(
                  height: 10,
                  width: 10,
                  child: Container(
                      height: 40.0,
                      width: 40.0,
                      child: Image.asset('images/esport.jpg',
                          fit: BoxFit.fitWidth))),
            ),
          ),
          // FittedBox(
          //   child: Image.network('assets/images/esport.jpg', height: 100,),
          //   fit: BoxFit.fitWidth,
          // ),
          SizedBox(height: 40),
          FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: .6,
            child: Padding(
              padding: EdgeInsets.only(left: 190),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40),
                    Text(
                      "Reveri Games",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat-Regular",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Montserrat-Regular",
                          color: Colors.white),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.facebook),
                          backgroundColor: Color.fromRGBO(12, 12, 12, 1),
                        ),
                        CircleAvatar(
                          child: Icon(Icons.biotech_rounded),
                          backgroundColor: Color.fromRGBO(12, 12, 12, 1),
                        ),
                        CircleAvatar(
                          child: Icon(Icons.hot_tub),
                          backgroundColor: Color.fromRGBO(12, 12, 12, 1),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 200, height: 50),
                      child: ElevatedButton(
                          child: Text("Browse more".toUpperCase(),
                              style: TextStyle(fontSize: 15)),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      side: BorderSide(color: Colors.red)))),
                          onPressed: () => null),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
