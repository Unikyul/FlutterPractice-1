import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //HomePage로 한 이유는 순수하게 디자인 하기 위해서,
      home: HomePage(),
    );
  }
}

//클래스 책임이 분리가 되었다. 여기는 하나의 화면
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //위에 appvar 넣기
      appBar: AppBar(
        actions: [
          Icon(Icons.search),
          Icon(
            CupertinoIcons.heart,
            color: Colors.redAccent,
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            _title(),
            SizedBox(height: 20),
            _Menu(),
            SizedBox(height: 20),
            Container(
              height: 300,
              color: Colors.red,
            ),
            Placeholder(),
            Container(
              height: 300,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Text _title() {
    return Text(
      "Recipes",
      style: GoogleFonts.patuaOne(
        textStyle: TextStyle(fontSize: 30),
      ),
    );
  }

  Row _Menu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //_하면 다른 곳에서 쓰지 못한다. 우리가 만든 메소드는 m을 붙이자
        //재사용 가능한 메소드, 처음부터 만들고 메소드를 만든다.
        _mIcon(Icons.food_bank, "ALL"),
        SizedBox(width: 25),
        _mIcon(Icons.emoji_food_beverage, "Coffee"),
        SizedBox(width: 25),
        _mIcon(Icons.fastfood, "Burger"),
        SizedBox(width: 25),
        _mIcon(Icons.local_pizza, "Pizza"),
      ],
    );
  }

  Container _mIcon(IconData mIcon, String text) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
          //border는 추상 클래스라서 생성자를 못 한다.
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(30)),
      //안에 하나만 가질 수 있다.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            mIcon,
            color: Colors.redAccent,
            size: 30,
          ),
          SizedBox(height: 5),
          //글자 스타일 꾸미는 방법
          Text("$text",
              style: TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
