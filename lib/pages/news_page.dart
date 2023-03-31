import 'package:binokor_web/pages/catalog_main_page.dart';
import 'package:binokor_web/widgets/videos_news/video.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'package:intl/intl.dart';

import '../conrollers/Controller.dart';
import '../models/News.dart';
import '../models/uij.dart';

String imagepath = '';

DateFormat formattedDate = DateFormat('dd-MM-yyyy');
final Controller _controller = Get.find();

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: main(context),
      );
    });
  }

  Widget main(BuildContext context) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Новости",
            style: TextStyle(
                fontFamily: UiJ.fontbold,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        Divider(),
        SizedBox(
          height: 10,
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
            itemCount: _controller.listnews.length,
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
                                        '${UiJ.url}news/download/news/${_controller.listnews.value[index].imagepath}',
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
                                                  DateTime.parse(_controller
                                                      .listnews
                                                      .value[index]
                                                      .datacreate!)),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: UiJ.fontbold),
                                            ),
                                            alignment: Alignment.topRight,
                                          ),
                                          Container(
                                              child: Text(
                                            _controller
                                                .listnews.value[index].title!,
                                            style: TextStyle(
                                                fontFamily: UiJ.fontbold,
                                                fontSize: 30,
                                                color: Colors.indigoAccent),
                                          )),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                              _controller.listnews.value[index]
                                                  .description!,
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
                          _controller.news.value =
                              _controller.listnews.value[index];
                          if (_controller
                                  .listnews.value[index].imagenews!.length !=
                              0) {
                            if (_controller
                                    .listnews.value[index].imagenews!.length >
                                0) {
                              imagepath = _controller.listnews.value[index]
                                  .imagenews![0].imagepath!;
                            }
                            showDialogphoto(context,
                                _controller.listnews.value[index].title!);
                          }
                          if (_controller.listnews.value[index].id == 32 ||
                              _controller.listnews.value[index].id == 33) {
                            showDialogVideo(
                                context,
                                _controller.listnews.value[index].title!,
                                _controller.listnews.value[index]);
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
            itemCount: _controller.listnews.value.length,
            itemBuilder: (context, index) {
              return HoverContainer(
                  hoverColor: UiJ.hovercolor,
                  child: InkWell(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Card(
                                  elevation: 5,
                                  child: Container(
                                      child: Image.network(
                                          '${UiJ.url}news/download/news/${_controller.listnews.value[index].imagepath}',
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
                                        _controller.listnews.value[index]
                                            .datacreate!)),
                                    style: TextStyle(
                                        fontSize: 15, fontFamily: UiJ.fontbold),
                                  ),
                                  alignment: Alignment.topRight,
                                ),
                                Container(
                                    child: Text(
                                  _controller.listnews.value[index].title!,
                                  style: TextStyle(
                                      fontFamily: UiJ.fontbold,
                                      fontSize: 20,
                                      color: Colors.indigoAccent),
                                )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    _controller
                                        .listnews.value[index].description!,
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
                        controller.news.value =
                            _controller.listnews.value[index];
                        if (_controller
                                .listnews.value[index].imagenews!.length !=
                            0) {
                          if (_controller
                                  .listnews.value[index].imagenews!.length >
                              0) {
                            imagepath = _controller
                                .listnews.value[index].imagenews![0].imagepath!;
                          }
                          showDialogphoto(context,
                              _controller.listnews.value[index].title!);
                        }

                        if (_controller.listnews.value[index].id == 32 ||
                            _controller.listnews.value[index].id == 33) {
                          showDialogVideo(
                              context,
                              _controller.listnews.value[index].title!,
                              _controller.listnews.value[index]);
                        }
                      }));
            }));
  }

  Future<void> showDialogphoto(BuildContext context, String title) async {
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
                horizontal: _controller.news.value.videopath == null
                    ? isMobile(context)
                        ? 20
                        : 40
                    : isMobile(context)
                        ? 10
                        : 40,
                vertical: _controller.news.value.videopath == null
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
                    ? _controller.news.value.videopath == null
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: ListView.builder(
                                    itemCount: _controller
                                        .news.value.imagenews!.length,
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
                                                imagepath = _controller
                                                    .news
                                                    .value
                                                    .imagenews![idx]
                                                    .imagepath!;
                                              });
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: Image.network(
                                                '${UiJ.url}news/download/imagenews/${_controller.news.value.imagenews![idx].imagepath}',
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
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: VideoVistavka(
                                              path:
                                                  'news/download/newsvideo${_controller.news.value.videopath}',
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
                                itemCount:
                                    _controller.news.value.imagenews!.length,
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
                                            imagepath = _controller.news.value
                                                .imagenews![idx].imagepath!;
                                          });
                                        },
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          child: Image.network(
                                            '${UiJ.url}news/download/imagenews/${_controller.news.value.imagenews![idx].imagepath}',
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
                            itemCount: _controller.news.value.imagenews!.length,
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
                                        imagepath = _controller.news.value
                                            .imagenews![idx].imagepath!;
                                      });
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        '${UiJ.url}news/download/imagenews/${_controller.news.value.imagenews![idx].imagepath}',
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
                          if (_controller.news.value.videopath == null)
                            VerticalDivider(
                              thickness: 1.5,
                            ),
                          if (_controller.news.value.videopath == null)
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: VideoVistavka(
                                    path:
                                        'news/download/newsvideo${_controller.news.value.videopath}',
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
                    child: VideoVistavka(
                      path: 'news/download/newsvideo${news.videopath}',
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
