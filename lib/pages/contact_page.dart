import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../models/uij.dart';
import '../widgets/googlemap.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width > UiJ.widthSize ? 100 : 20,
            right: MediaQuery.of(context).size.width > UiJ.widthSize ? 100 : 20,
            top: 30),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(S.of(context).adress_company,
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width > UiJ.widthSize
                              ? 30
                              : 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: UiJ.fontbold)),
            ),
            Divider(),
            SizedBox(
              height:
                  MediaQuery.of(context).size.width > UiJ.widthSize ? 30 : 10,
            ),
            MediaQuery.of(context).size.width > UiJ.widthSize
                ? forWeb(context)
                : forPhone(context),
          ],
        ));
  }

  Widget forWeb(BuildContext context) {
    return Container(
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
          child: Column(
        children: [
          Container(
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.location_on_rounded,
                                color: Colors.blue)),
                        WidgetSpan(
                            child: SizedBox(
                          width: 10,
                        )),
                        TextSpan(
                            text: '${UiJ.adress}',
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width >
                                        UiJ.widthSize
                                    ? 25
                                    : 15,
                                fontWeight: FontWeight.w200,
                                fontFamily: UiJ.font))
                      ]),
                    )
                  ])),
          SizedBox(
            height: 50,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).telephone,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width >
                                    UiJ.widthSize
                                ? 30
                                : 20,
                            fontFamily: UiJ.fontbold)),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        )),
                        TextSpan(
                            text: '${UiJ.phone}',
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width >
                                        UiJ.widthSize
                                    ? 25
                                    : 15,
                                fontWeight: FontWeight.w200,
                                fontFamily: UiJ.font))
                      ]),
                    )
                  ])),
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: InkWell(
                onTap: () {
                  UiJ.callTelegram;
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).socset,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width >
                                      UiJ.widthSize
                                  ? 30
                                  : 20,
                              fontFamily: UiJ.fontbold)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: IconButton(
                                      onPressed: () {
                                        UiJ.callTelegram();
                                      },
                                      icon: Icon(
                                        Icons.telegram,
                                        color: Colors.blue,
                                        size: 50,
                                      ),
                                    ))),
                            Expanded(
                                child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: IconButton(
                                      onPressed: () {
                                        UiJ.callInstagram();
                                      },
                                      icon: Image.asset(
                                        'assets/images/Instagram_icon.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                    ))),
                            Expanded(
                              child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: IconButton(
                                      onPressed: () {
                                        UiJ.callFacebook();
                                      },
                                      icon: Icon(
                                        Icons.facebook,
                                        color: Colors.blue,
                                        size: 50,
                                      ))),
                            )
                          ],
                        ),
                      )
                      // child: InkWell(
                      //     onTap: () {
                      //       UiJ.callTelegram();
                      //     },
                      //     child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Icon(Icons.telegram, color: Colors.blue),
                      //           SizedBox(
                      //             width: 10,
                      //           ),
                      //           // RichText(
                      //           //   text: TextSpan(children: [
                      //           //     TextSpan(
                      //           //         text: UiJ.telegram,
                      //           //         style: TextStyle(
                      //           //             // fontSize: 25,
                      //           //             fontWeight: FontWeight.w200,
                      //           //             fontFamily: UiJ.font))
                      //           //   ]),
                      //           // )
                      //         ]))),
                      //
                      // Container(
                      //     alignment: Alignment.topLeft,
                      //     child: InkWell(
                      //         onTap: () {
                      //           UiJ.callInstagram();
                      //         },
                      //         child: Row(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Image.asset(
                      //                 'assets/images/Instagram_icon.png',
                      //                 width: 30,
                      //                 height: 30,
                      //               ),
                      //               SizedBox(
                      //                 width: 10,
                      //               ),
                      //               RichText(
                      //                 text: TextSpan(children: [
                      //                   TextSpan(
                      //                       text: UiJ.inhstagram,
                      //                       style: TextStyle(
                      //                           // fontSize: 25,
                      //                           fontWeight: FontWeight.w200,
                      //                           fontFamily: UiJ.font))
                      //                 ]),
                      //               )
                      //             ]))),
                    ])),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: InkWell(
                onTap: () {
                  // UiJ.callTelegram;
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).email,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width >
                                      UiJ.widthSize
                                  ? 30
                                  : 20,
                              fontFamily: UiJ.fontbold)),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                              text: "info@dsk.uz",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width >
                                          UiJ.widthSize
                                      ? 25
                                      : 15,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: UiJ.font))
                        ]),
                      )
                    ])),
          )
        ],
      )),
      VerticalDivider(),
      Expanded(
        flex: 2,
        child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.height / 1.5,
            padding: EdgeInsets.all(10),
            child: Card(child: GoogleMap())),
      )
    ]));
  }

  Widget forPhone(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(children: [
          RichText(
              text: TextSpan(children: [
            WidgetSpan(
                child: Icon(Icons.location_on_rounded, color: Colors.blue)),
            TextSpan(
                text: '${UiJ.adress}',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width > UiJ.widthSize
                        ? 25
                        : 15,
                    fontWeight: FontWeight.w200,
                    fontFamily: UiJ.font))
          ])),
          SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).telephone,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width >
                                    UiJ.widthSize
                                ? 30
                                : 20,
                            fontFamily: UiJ.fontbold)),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        WidgetSpan(
                            child: Icon(
                          Icons.phone,
                          color: Colors.blue,
                        )),
                        TextSpan(
                            text: '${UiJ.phone}',
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width >
                                        UiJ.widthSize
                                    ? 25
                                    : 15,
                                fontWeight: FontWeight.w200,
                                fontFamily: UiJ.font))
                      ]),
                    )
                  ])),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: InkWell(
                onTap: () {
                  UiJ.callTelegram;
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).telegram,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width >
                                      UiJ.widthSize
                                  ? 30
                                  : 20,
                              fontFamily: UiJ.fontbold)),
                      SizedBox(
                        height: 10,
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
                        // RichText(
                        //   text: TextSpan(children: [
                        //     WidgetSpan(
                        //       child: Icon(
                        //         Icons.telegram,
                        //         color: Colors.blue,
                        //       ),
                        //     ),
                        //     TextSpan(
                        //         text: UiJ.telegram,
                        //         style: TextStyle(
                        //             fontSize: MediaQuery.of(context).size.width >
                        //                     UiJ.widthSize
                        //                 ? 25
                        //                 : 15,
                        //             fontWeight: FontWeight.w200,
                        //             fontFamily: UiJ.font))
                        //   ]),
                        // )
                      )
                    ])),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: InkWell(
                onTap: () {
                  // UiJ.callTelegram;
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).email,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width >
                                      UiJ.widthSize
                                  ? 30
                                  : 20,
                              fontFamily: UiJ.fontbold)),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                              text: "info@dsk.uz",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width >
                                          UiJ.widthSize
                                      ? 25
                                      : 15,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: UiJ.font))
                        ]),
                      )
                    ])),
          ),
          VerticalDivider(),
          Expanded(
            flex: 2,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                // padding: EdgeInsets.all(10),
                child: Card(child: GoogleMap())),
          )
        ]));
  }
}
