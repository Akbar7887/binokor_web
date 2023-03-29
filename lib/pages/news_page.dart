import 'package:binokor_web/pages/catalog_main_page.dart';
import 'package:binokor_web/widgets/videos_news/video.dart';
import 'package:binokor_web/widgets/videos_news/video_den_zashit.dart';
import 'package:binokor_web/widgets/videos_news/video_denzashit_first.dart';
import 'package:binokor_web/widgets/videos_news/video_football.dart';
import 'package:binokor_web/widgets/videos_news/video_intervyu.dart';
import 'package:binokor_web/widgets/videos_news/video_prepodgotovka.dart';
import 'package:binokor_web/widgets/videos_news/video_vstupleniya.dart';
import 'package:conditioned/conditioned.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:intl/intl.dart';
import '../getconrollers/Controller.dart';
import '../models/News.dart';
import '../models/uij.dart';

List<News> _listnews = [];
String imagepath = '';

DateFormat formattedDate = DateFormat('dd-MM-yyyy');

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.find();
    return Obx(() {
      _listnews = controller.listnews;
      return main(context);
    });
  }

  Widget main(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Padding(
            padding: EdgeInsets.only(left: 100, right: 100),
            child: Container(
              padding: EdgeInsets.only(top: 20),
              alignment: Alignment.topLeft,
              child: Text(
                "Новости",
                style: TextStyle(
                    fontFamily: UiJ.fontbold,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            )),
        Divider(),
        SizedBox(
          height: 30,
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: MediaQuery.of(context).size.width > UiJ.widthSize
                ? listWeb(context)
                : listPhone(context))
      ],
    );
  }

  Widget listWeb(context) {
    return Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width > UiJ.widthSize ? 50 : 20,
            right: MediaQuery.of(context).size.width > UiJ.widthSize ? 50 : 20),
        child: ListView.builder(
            itemCount: _listnews.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HoverContainer(
                      hoverColor: UiJ.hovercolor,
                      cursor: MouseCursor.defer,
                      child: InkWell(
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                    // padding: EdgeInsets.only(left: 100, right: 100),
                                    // margin: EdgeInsets.all(20),
                                    child: Image.network(
                                        '${UiJ.url}news/download/news/${_listnews[index].imagepath}',
                                        width: double.infinity,
                                        height: 300, errorBuilder:
                                            (context, exception, stackTrace) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                })),
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              formattedDate.format(
                                                  DateTime.parse(
                                                      _listnews[index]
                                                          .datacreate!)),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: UiJ.fontbold),
                                            ),
                                            alignment: Alignment.topRight,
                                          ),

                                          Container(
                                              child: Text(
                                            _listnews[index].title!,
                                            style: TextStyle(
                                                fontFamily: UiJ.fontbold,
                                                fontSize: 30,
                                                color: Colors.indigoAccent),
                                          )),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(_listnews[index].description!,
                                              textAlign: TextAlign.justify,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w200,
                                                  fontFamily: UiJ.font))
                                          // Spacer(),
                                        ])),
                              ],
                            )),
                        onTap: () {
                          if (_listnews[index].imagenews!.length != 0) {
                            if (_listnews[index].imagenews!.length > 0) {
                              imagepath =
                                  _listnews[index].imagenews![0].imagepath!;
                            }
                            showDialogphoto(context, _listnews[index].title!,
                                _listnews[index]);
                          }

                          if (_listnews[index].id == 32 ||
                              _listnews[index].id == 33 ) {
                            showDialogVideo(context, _listnews[index].title!,
                                _listnews[index]);
                          }

                          // showDialogphoto(context, _listnews[index].title!,
                          //     _listnews[index]);
                        },
                      )),
                  Divider()
                ],
              );
            }));
  }

  Widget listPhone(context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView.builder(
            itemCount: _listnews.length,
            itemBuilder: (context, index) {
              return HoverContainer(
                  hoverColor: UiJ.hovercolor,
                  child: InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(15)),
                              child: Card(
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius: BorderRadius.circular(15)),
                                  elevation: 5,
                                  child: Container(
                                      // padding: EdgeInsets.all(20),
                                      // decoration: BoxDecoration(
                                      //     borderRadius:
                                      //         BorderRadius.circular(15)),
                                      child: Image.network(
                                          '${UiJ.url}news/download/news/${_listnews[index].imagepath}',
                                          width: 500,
                                          height: 300, errorBuilder:
                                              (context, exception, stackTrace) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  })))),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                Container(
                                  child: Text(
                                    formattedDate.format(DateTime.parse(
                                        _listnews[index].datacreate!)),
                                    style: TextStyle(
                                        fontSize: 15, fontFamily: UiJ.fontbold),
                                  ),
                                  alignment: Alignment.topRight,
                                ),
                                Container(
                                    child: Text(
                                  _listnews[index].title!,
                                  style: TextStyle(
                                      fontFamily: UiJ.fontbold,
                                      fontSize: 20,
                                      color: Colors.indigoAccent),
                                )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(_listnews[index].description!,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: UiJ.font))
                                // Spacer(),
                              ])),
                        ],
                      ),
                      onTap: () {
                        if (_listnews[index].imagenews!.length != 0) {
                          if (_listnews[index].imagenews!.length > 0) {
                            imagepath =
                                _listnews[index].imagenews![0].imagepath!;
                          }
                          showDialogphoto(context, _listnews[index].title!,
                              _listnews[index]);
                        }

                        if (_listnews[index].id == 32 ||
                            _listnews[index].id == 33 ) {
                          showDialogVideo(context, _listnews[index].title!,
                              _listnews[index]);
                        }
                      }));
            }));
  }

  Future<void> showDialogphoto(
      BuildContext context, String title, News news) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            iconPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            insetPadding: EdgeInsets.symmetric(
                horizontal: news.id == 41 ||
                        news.id == 21 ||
                        news.id == 23 ||
                        news.id == 24
                    ? isMobile(context)
                        ? 20
                        : 40
                    : isMobile(context)
                        ? 10
                        : 40,
                vertical: news.id == 41 ||
                        news.id == 21 ||
                        news.id == 23 ||
                        news.id == 24
                    ? isMobile(context)
                        ? 30
                        : 20
                    : isMobile(context)
                        ? 100
                        : 20),
            alignment: Alignment.center,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile(context) ? 14 : 24,
                    fontFamily: UiJ.fontbold,
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
              ],
            ),
            content: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: isMobile(context)
                    ? news.id == 41 ||
                            news.id == 21 ||
                            news.id == 23 ||
                            news.id == 24
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: ListView.builder(
                                    itemCount: news.imagenews!.length,
                                    itemBuilder: (context, idx) {
                                      return Card(
                                          shape: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                      controller.isChecked(idx)
                                                          ? UiJ.selectedcolor!
                                                          : Colors.black12,
                                                  width: 4.0),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          color: controller.isChecked(idx)
                                              ? UiJ.selectedcolor
                                              : Colors.white.withOpacity(0.9),
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            hoverColor: UiJ.hovercolor,
                                            onTap: () {
                                              setState(() {
                                                controller.clickedItemPosition =
                                                    idx;
                                                imagepath = news
                                                    .imagenews![idx].imagepath!;
                                              });
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Image.network(
                                                '${UiJ.url}news/download/imagenews/${news.imagenews![idx].imagepath}',
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    7,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    6,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context,
                                                    exception, stackTrace) {
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                },
                                              ),
                                            ),
                                          ));
                                    },
                                  )),
                              VerticalDivider(
                                thickness: 1.5,
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            child: Image.network(
                                                '${UiJ.url}news/download/imagenews/${imagepath}',
                                                fit: BoxFit.cover,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                errorBuilder: (context,
                                                    exception, stackTrace) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            })),
                                      ),
                                      Divider(
                                        thickness: 1.5,
                                      ),
                                      if (news.id == 41 ||
                                          news.id == 21 ||
                                          news.id == 23 ||
                                          news.id == 24)
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Conditioned(
                                                cases: [
                                                  Case(news.id == 41,
                                                      builder: () =>
                                                          VideoVistavka()),
                                                  Case(news.id == 21,
                                                      builder: () =>
                                                          VideoDenZashit()),
                                                  Case(news.id == 23,
                                                      builder: () =>
                                                          VideoPrepodgotovka()),
                                                  Case(news.id == 24,
                                                      builder: () =>
                                                          VideoFootball()),
                                                ],
                                                defaultBuilder: () => Text(""),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                        '${UiJ.url}news/download/imagenews/${imagepath}',
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        errorBuilder:
                                            (context, exception, stackTrace) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    })),
                              ),
                              Divider(
                                thickness: 1.5,
                              ),
                              Expanded(
                                  child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: news.imagenews!.length,
                                itemBuilder: (context, idx) {
                                  return Card(
                                      shape: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: controller.isChecked(idx)
                                                  ? UiJ.selectedcolor!
                                                  : Colors.black12,
                                              width: 7.0),
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      color: controller.isChecked(idx)
                                          ? UiJ.selectedcolor
                                          : Colors.white.withOpacity(0.9),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        hoverColor: UiJ.hovercolor,
                                        onTap: () {
                                          setState(() {
                                            controller.clickedItemPosition =
                                                idx;
                                            imagepath =
                                                news.imagenews![idx].imagepath!;
                                          });
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.network(
                                            '${UiJ.url}news/download/imagenews/${news.imagenews![idx].imagepath}',
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                7,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6,
                                            fit: BoxFit.fill,
                                            errorBuilder: (context, exception,
                                                stackTrace) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            },
                                          ),
                                        ),
                                      ));
                                },
                              )),
                            ],
                          )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: ListView.builder(
                            itemCount: news.imagenews!.length,
                            itemBuilder: (context, idx) {
                              return Card(
                                  shape: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: controller.isChecked(idx)
                                              ? UiJ.selectedcolor!
                                              : Colors.black12,
                                          width: 7.0),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  color: controller.isChecked(idx)
                                      ? UiJ.selectedcolor
                                      : Colors.white.withOpacity(0.9),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(15.0),
                                    hoverColor: UiJ.hovercolor,
                                    onTap: () {
                                      setState(() {
                                        controller.clickedItemPosition = idx;
                                        imagepath =
                                            news.imagenews![idx].imagepath!;
                                      });
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        '${UiJ.url}news/download/imagenews/${news.imagenews![idx].imagepath}',
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, exception, stackTrace) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      ),
                                    ),
                                  ));
                            },
                          )),
                          VerticalDivider(
                            thickness: 1.5,
                          ),
                          Expanded(
                            flex: 3,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                    '${UiJ.url}news/download/imagenews/${imagepath}',
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    errorBuilder:
                                        (context, exception, stackTrace) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                })),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          if (news.id == 41 ||
                              news.id == 21 ||
                              news.id == 23 ||
                              news.id == 24)
                            VerticalDivider(
                              thickness: 1.5,
                            ),
                          if (news.id == 41 ||
                              news.id == 21 ||
                              news.id == 23 ||
                              news.id == 24)
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Conditioned(
                                    cases: [
                                      Case(news.id == 41,
                                          builder: () => VideoVistavka()),
                                      Case(news.id == 21,
                                          builder: () => VideoDenZashit()),
                                      Case(news.id == 23,
                                          builder: () => VideoPrepodgotovka()),
                                      Case(news.id == 24,
                                          builder: () => VideoFootball()),
                                    ],
                                    defaultBuilder: () => Text(""),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Закрыть',
                  style: TextStyle(fontSize: 20, fontFamily: UiJ.fontbold),
                ),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
            ],
          );
        });
      },
    );
  }

  Future<void> showDialogVideo(
      BuildContext context, String title, News news) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            iconPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.symmetric(
                vertical: isMobile(context) ? 100 : 10,
                horizontal: isMobile(context) ? 10 : 170),
            alignment: Alignment.center,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isMobile(context) ? 14 : 24,
                    fontFamily: UiJ.fontbold,
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
              ],
            ),
            content: Center(
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Conditioned(
                      cases: [
                        Case(news.id == 32, builder: () => VideoIntervyu()),
                        Case(news.id == 33, builder: () => VideoVstupleniya()),
                      ],
                      defaultBuilder: () => Text(""),
                    ),
                  ),
                ),
              ),
            ),
            actionsPadding: EdgeInsets.all(2),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Закрыть',
                  style: TextStyle(fontSize: 20, fontFamily: UiJ.fontbold),
                ),
                onPressed: () {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                },
              ),
            ],
          );
        });
      },
    );
  }
}
