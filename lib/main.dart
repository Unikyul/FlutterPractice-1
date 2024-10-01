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
      appBar: AppBar(
        actions: [
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(CupertinoIcons.heart, color: Colors.redAccent),
          SizedBox(width: 16)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            _title(),
            SizedBox(height: 10),
            _menu(),
            SizedBox(height: 10),
            RecipeItem("burger.jpeg", "burger"),
            RecipeItem("coffee.jpeg", "coffee"),
            RecipeItem("pizza.jpeg", "pizza"),
          ],
        ),
      ),
    );
  }

//제목
  Text _title() {
    return Text(
      "Recipes",
      style: GoogleFonts.patuaOne(
        textStyle: TextStyle(fontSize: 30),
      ),
    );
  }

  //메뉴

  Row _menu() {
    return Row(
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

  //아이콘

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
          Text(
            "$text",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

//RecipeItem 컬럼
class RecipeItem extends StatelessWidget {
  //이렇게 쓰는 방법은 const만 지우면 가능하다.
  String imageName;
  String text;

  //생성자 , new를 백번해도 한번만 뜬다. 상태가 없으면 const를 지운다.
  // const  RecipeItem();
  RecipeItem(this.imageName, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            //가로가 2 세로가 1
            aspectRatio: 3 / 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset("assets/$imageName", fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "$text",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Have you ever made your own $text? Once you've tried a homemade $text, you'll never go back.",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
