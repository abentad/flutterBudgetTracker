import 'package:flutter/material.dart';

Widget buildAddCard(
    {String textInsideCircle, String text, Function press, Color bgColor}) {
  return InkWell(
    onTap: press,
    child: Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: bgColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Text(
                      textInsideCircle,
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
