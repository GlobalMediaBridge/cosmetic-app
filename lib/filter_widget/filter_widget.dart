
import 'package:cosmetic_app/values/values.dart';
import 'package:flutter/material.dart';


class FilterWidget extends StatelessWidget {
  
  void onButtonThreePressed(BuildContext context) {
  
  }
  
  void onButtonTwoPressed(BuildContext context) {
  
  }
  
  void onButtonPressed(BuildContext context) {
  
  }
  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 500,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    top: 24,
                    right: 19,
                    child: FlatButton(
                      onPressed: () => this.onButtonThreePressed(context),
                      color: AppColors.primaryText,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      textColor: Color.fromARGB(255, 255, 255, 255),
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "저장",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: "NanumBarunGothic",
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 167,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBackground,
                      ),
                      child: Container(),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 375,
                            height: 55,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 188,
                                    height: 55,
                                    child: FlatButton(
                                      onPressed: () => this.onButtonPressed(context),
                                      color: AppColors.secondaryBackground,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(0)),
                                      ),
                                      textColor: Color.fromARGB(255, 154, 154, 155),
                                      padding: EdgeInsets.all(0),
                                      child: Text(
                                        "컬러",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 154, 154, 155),
                                          fontFamily: "NanumBarunGothic",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: 188,
                                    height: 55,
                                    child: FlatButton(
                                      onPressed: () => this.onButtonTwoPressed(context),
                                      color: AppColors.secondaryBackground,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(0)),
                                      ),
                                      textColor: Color.fromARGB(255, 154, 154, 155),
                                      padding: EdgeInsets.all(0),
                                      child: Text(
                                        "필터",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 154, 154, 155),
                                          fontFamily: "NanumBarunGothic",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 325,
                          height: 81,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 81,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 174, 174, 174),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 81,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 174, 174, 174),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 81,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 174, 174, 174),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 81,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 174, 174, 174),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 81,
                                  margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 174, 174, 174),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Container(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 75,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 57,
                            height: 44,
                            child: Image.asset(
                              "assets/images/-802.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: 57,
                            height: 44,
                            margin: EdgeInsets.only(left: 77),
                            child: Image.asset(
                              "assets/images/heart-2.png",
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}