import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String eqn = "", n1 = "", n2 = "", result = "";

  void calculate() {
    setState(() {
      result = "";
      if (n1 == n2) {
        n2 = "";
        eqn = n1;
      }

      if ((n1 == "Egg") || (n2 == "Egg")) {
        if ((n1 == "") || (n2 == "")) {
          eqn = n1;
          result = "Fried Egg, Boiled Eggs";
        } else if ((n1 == "Chicken") || (n2 == "Chicken")) {
          result = "Chicken Frittata";
        } else if ((n1 == "Ramen") || (n2 == "Ramen")) {
          result = "Ramen with Egg";
        } else if ((n1 == "Lettuce") || (n2 == "Lettuce")) {
          result = "Egg Salad Lettuce Wrap";
        } else if ((n1 == "Bread") || (n2 == "Bread")) {
          result = "Egg Sandwich";
        } else if ((n1 == "Spam") || (n2 == "Spam")) {
          result = "Spam Omelette";
        } else if ((n1 == "Tuna") || (n2 == "Tuna")) {
          result = "Tuna Scrambled Egg";
        } else if ((n1 == "Rice") || (n2 == "Rice")) {
          result = "Egg Fried Rice";
        }
      }
      if ((n1 == "Tuna") || (n2 == "Tuna")) {
        if ((n1 == "") || (n2 == "")) {
          eqn = n1;
          result = "Tuna Salad";
        } else if ((n1 == "Chicken") || (n2 == "Chicken")) {
          result = "Chicken Tuna Salad";
        }
      }
    });
  }

  void backspace() {
    setState(() {
      n2 = "";
      result = "";
      eqn = n1;
    });
  }

  void reset() {
    setState(() {
      n1 = "";
      n2 = "";
      result = "";
      eqn = "";
    });
  }

  append(String ingredient) {
    setState(() {
      if ((n1 != "") && (n2 != "")) {
        n1 = ingredient;
        n2 = "";
        eqn = n1;
      } else if ((n1 == ingredient) || (n2 == ingredient)) {
        n2 = "";
        eqn = n1;
      } else if (n1 == "") {
        n1 = ingredient;
        eqn = n1;
      } else if ((n1 != "") && (n2 == "")) {
        n2 = ingredient;
        eqn = "$n1 + $n2";
      }
    });
  }

  Widget foodItemBuild(String buttonText, Color buttonColor) {
    /*return MaterialButton(
      height: 85,
      child: Text(buttonText),
      onPressed: () => append(buttonText),
      color: buttonColor,
    );*/
    return Container(
        margin: EdgeInsets.only(bottom: 0),
        width: 100,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset('assets/rice.jpeg'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        blurRadius: 20,
                        color: Color(0x440000000))
                  ]),
              child: Row(
                children: [Text(buttonText)],
              ),
            )
          ],
        ));
    /*return NeumorphicButton(
      margin: EdgeInsets.only(top: 12),
      onPressed: () => append(buttonText),
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
        //border: NeumorphicBorder()
      ),
      padding: const EdgeInsets.all(12.0),
      child: Text(buttonText, style: TextStyle(color: Colors.black)),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FocalCulator")),
      body: Container(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  foodItemBuild("Egg", Colors.lightGreenAccent),
                  foodItemBuild("Tuna", Colors.lightGreenAccent),
                  foodItemBuild("Chicken", Colors.lightGreenAccent),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     foodItemBuild("Ramen", Colors.lightGreenAccent),
              //     foodItemBuild("Lettuce", Colors.lightGreenAccent),
              //     foodItemBuild("Cheese", Colors.lightGreenAccent),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     foodItemBuild("Bread", Colors.lightGreenAccent),
              //     foodItemBuild("Spam", Colors.lightGreenAccent),
              //     foodItemBuild("Rice", Colors.lightGreenAccent),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    child: const Text("Calculate"),
                    onPressed: calculate,
                    color: Colors.lightGreenAccent,
                  ),
                  MaterialButton(
                    child: const Text("Reset"),
                    onPressed: reset,
                    color: Colors.lightGreenAccent,
                  ),
                  MaterialButton(
                    child: const Text("⌫"),
                    onPressed: backspace,
                    color: Colors.lightGreenAccent,
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Text(
                eqn,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              Text(
                "Result: $result",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
