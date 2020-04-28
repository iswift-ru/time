import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'spiner.dart';

DateTime _dateTime = DateTime.now();

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectTime(),
    ),
  );
}

class SelectTime extends StatefulWidget {
  @override
  _SelectTimeState createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(height: 124),
        body: Column(
          children: <Widget>[
            //headerApp(),
            underHeader(),
            Expanded(
                child: Container(
              child: hourMinute15Interval(),
            )),
            footerApp()
          ],
        ));
  }

  Widget hourMinute15Interval() {
    return TimePickerSpinner(
      highlightedTextStyle:
          TextStyle(fontSize: 48, fontFamily: 'Sofia Pro Regular'),
      normalTextStyle: TextStyle(
          fontSize: 40,
          color: Color.fromRGBO(0, 0, 0, 0.15),
          fontFamily: 'Sofia Pro Regular'),
      alignment: Alignment.topCenter,
      isForce2Digits: true,
      spacing: 80,
      itemWidth: 58.0,
      itemHeight: 100.0,
      minutesInterval: 1,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
}

/*Widget headerApp() {
  return Container(
    //alignment: Alignment.topLeft,
    //padding: EdgeInsets.all(21),
    height: 124.0,
    width: double.infinity,
    color: Color(0xFF00539C),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SingleChildScrollView(),
        Padding(
          padding: const EdgeInsets.only(left: 11, top: 11),
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 14.0,
            ),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 72, top: 6),
          child: Text(
            'PASIRINKITE LAIKA',
            style: TextStyle(
                fontSize: 12, color: Colors.white, letterSpacing: 1.5),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 72, top: 6),
          child: Text(
            _dateTime.hour.toString().padLeft(2, '0') +
                ' : ' +
                _dateTime.minute.toString().padLeft(2, '0'),
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Sofia Pro Regular'),
          ),
        ),
      ],
    ),
  );
}*/

Widget underHeader() {
  return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        child: Text(
          'DABAR',
          style: TextStyle(
              fontSize: 14, color: Color(0xFF00539C), letterSpacing: 0.75),
        ),
      ));
}

Widget footerApp() {
  return Container(
      alignment: Alignment.center,
      height: 60,
      color: Color(0xFF00539C),
      width: double.infinity,
      child: Text(
        'PASIRINKITI',
        style: TextStyle(
            fontSize: 14, color: Color(0xFFFFFFFF), letterSpacing: 0.75),
      ));
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.topLeft,
      //padding: EdgeInsets.all(21),
      height: 124.0,
      width: double.infinity,
      color: Color(0xFF00539C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(),
          Padding(
            padding: const EdgeInsets.only(left: 11, top: 11),
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 14.0,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 72, top: 6),
            child: Text(
              'PASIRINKITE LAIKA',
              style: TextStyle(
                  fontSize: 12, color: Colors.white, letterSpacing: 1.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 72, top: 6),
            child: Text(
              _dateTime.hour.toString().padLeft(2, '0') +
                  ' : ' +
                  _dateTime.minute.toString().padLeft(2, '0'),
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: 'Sofia Pro Regular'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
