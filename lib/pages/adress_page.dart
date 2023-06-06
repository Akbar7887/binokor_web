import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../models/uij.dart';

class AdressPage extends StatelessWidget {
  const AdressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Padding(
            padding: EdgeInsets.only(left: 80, right: 80, top: 20),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).adress,
                              style: TextStyle(
                                  fontSize: UiJ.sizeweight(context) ? 25 : 30,
                                  fontFamily: UiJ.fontbold,
                                  color: Colors.white)),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_rounded,
                                      color: Colors.blue),
                              SizedBox(width: 10,),
                              Text('${UiJ.adress}',
                                  style: TextStyle(
                                      fontSize:
                                          UiJ.sizeweight(context) ? 20 : 25,
                                      fontWeight: FontWeight.w200,
                                      fontFamily: UiJ.font,
                                      color: Colors.white))
                            ]),

                        ])),
                SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                        onTap: () {
                          UiJ.callNumber(UiJ.phone);
                        },
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.phone,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: '${UiJ.phone}  ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w200,
                                          fontFamily: UiJ.font,
                                          color: Colors.white)),
                                ]),
                              )
                            ]))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        UiJ.callTelegram();
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.telegram, color: Colors.blue),
                            SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: UiJ.telegram,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font,
                                        color: Colors.white))
                              ]),
                            )
                          ])),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        UiJ.callInstagram();
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Image.asset(
                              'assets/images/Instagram_icon.png',
                              width: 30,
                              height: 30,
                            )),
                            SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: UiJ.inhstagram,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font,
                                        color: Colors.white))
                              ]),
                            )
                          ])),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        UiJ.callFacebook();
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Icon(Icons.facebook, color: Colors.blue,)),
                            SizedBox(
                              width: 10,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: UiJ.facebook,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font,
                                        color: Colors.white))
                              ]),
                            )
                          ])),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                      onTap: () {
                        // UiJ.callTelegram;
                      },
                      child: Column(
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: UiJ.email,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w200,
                                            fontFamily: UiJ.font,
                                            color: Colors.white))
                                  ]),
                                ),
                              ]),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              S.of(context).certificat,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w200),
                            ),
                          )
                        ],
                      )),
                )
              ],
            )));
  }
}
