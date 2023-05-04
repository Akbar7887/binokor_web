import 'package:binokor_web/conrollers/Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/uij.dart';
import 'aboutMenu_dropdown.dart';

String? dropname1;
List<String> listdrop = ['Руководство', 'Новости', 'Вакансии'];
bool _showmenu = false;
final Controller controller = Get.put(Controller());

class getDrawer extends StatelessWidget {
  const getDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Drawer(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
              child: InkWell(
            child: DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 0.5)),
                child: Column(
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/images/logo1.png',
                        width: 200,
                      ),
                    ),
                  ],
                )),
            onTap: () {
              controller.changeindexpage(1);
              controller.changeindextab(0);
            },
          )),
          // alignment: Alignment.centerLeft,
          ListTile(
            title: Text(
              'О Компании',
              style: TextStyle(
                  fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
            ),
            trailing: _showmenu
                ? Icon(
                    Icons.keyboard_arrow_down,
                    size: 25,
                  )
                : Icon(
                    Icons.keyboard_arrow_right_outlined,
                    size: 25,
                  ),
            iconColor: Colors.black38,
            onTap: () {
              setState(() {
                _showmenu = !_showmenu;
              });
              // controller.changeindexpage(1);
              // controller.changeindextab(1);
              // Navigator.pop(context);
            },
          ),
          _showmenu
              ? Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ListTile(
                      title: Center(
                          child: Text(
                        'Руководство',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: UiJ.font,
                            color: Colors.black),
                      )),
                      iconColor: Colors.black38,
                      trailing: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 25,
                      ),
                      onTap: () {
                        controller.changeindexpage(2);
                        controller.changeindextab(0);
                        Navigator.pop(context);
                        // controller.changeindexpage(1);
                        // controller.changeindextab(1);
                        // Navigator.pop(context);
                      },
                    ),
                    Divider(),
                    ListTile(
                      title: Center(
                          child: Text(
                        'Вакансия',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: UiJ.font,
                            color: Colors.black),
                      )),
                      iconColor: Colors.black38,
                      trailing: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 25,
                      ),
                      onTap: () {
                        controller.changeindexpage(4);
                        controller.changeindextab(0);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              : Container(),
          Divider(),
          ListTile(
            leading: Text(
              'Каталоги',
              style: TextStyle(
                  fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
            ),
            onTap: () {
              controller.changeindexpage(1);
              controller.changeindextab(1);
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Text(
              'Строительство',
              style: TextStyle(
                  fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
            ),
            onTap: () {
              controller.changeindexpage(1);
              controller.changeindextab(2);
              Navigator.pop(context);
            },
          ),
          Divider(),

          ListTile(
            leading: Text(
              'Производство',
              style: TextStyle(
                  fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
            ),
            onTap: () {
              controller.changeindexpage(1);
              controller.changeindextab(3);

              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Новости',
              style: TextStyle(
                  fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
            ),
            onTap: () {
              controller.changeindexpage(1);
              controller.changeindextab(4);
              Navigator.pop(context);
              // controller.changeindexpage(1);
              // controller.changeindextab(1);
              // Navigator.pop(context);
            },
          ),
          Divider(),

          ListTile(
            leading: Text(
              'Обучение',
              style: TextStyle(
                  fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
            ),
            onTap: () {
              controller.changeindexpage(1);
              controller.changeindextab(5);

              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Text(
              'Контакты',
              style: TextStyle(
                  fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
            ),
            onTap: () {
              controller.changeindexpage(1);
              controller.changeindextab(6);
              Navigator.pop(context);
            },
          ),
          Divider(),
          // ListTile(
          //   leading: Text(
          //     'Обратная связь',
          //     style: TextStyle(
          //         fontSize: 25, fontFamily: UiJ.font, color: Colors.black),
          //   ),
          //   onTap: () {},
          // ),
        ],
      ));
    });
  }
}
