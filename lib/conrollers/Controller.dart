import 'package:binokor_web/models/ImageDom.dart';
import 'package:binokor_web/models/Job.dart';
import 'package:binokor_web/models/Kompleks.dart';
import 'package:binokor_web/models/LightUser.dart';
import 'package:binokor_web/models/News.dart';
import 'package:get/get.dart';

import '../models/Dom.dart';
import '../models/Events.dart';
import '../models/Make.dart';
import '../models/Meneger.dart';
import '../models/Orderb.dart';
import 'ApiConnector.dart';

class Controller extends GetxController {
  final api = ApiConnector();
  Kompleks? kompleks;
  var indexpage = 0.obs;
  var indextab = 0.obs;

  var listMeneger = <Meneger>[].obs;
  var listKompleks = <Kompleks>[].obs;
  var listMake = <Make>[].obs;
  var listJob = <Job>[].obs;
  var listnews = <News>[].obs;
  Rx<News> news = News().obs;
  var listImageDom = <ImageDom>[].obs;
  Make? make;
  List<Orderb> orderlist = <Orderb>[].obs;
  String titleKompleks = '';
  int pageKomleks = 0;
  Rx<Events> events = Events().obs;

  int clickedItemPosition = 0;

  bool isChecked(currentPosition) => clickedItemPosition.obs == currentPosition;

  @override
  onInit() {
    fetchListKompleks();
    fetchListMeneger();
    fetchListMake();
    fetchListjob();
    fetchListnews();
    fetchEvent();
    indexpage.value = 1;
    indextab.value = 0;
    super.onInit();
  }

  Future<LightUser> postLightUser(String url, LightUser user) async {
    return await api.save(url, user);
  }

  fetchListKompleks() async {
    final json = await api.getall("kompleks/v1/get");
    listKompleks.value = json.map((e) => Kompleks.fromJson(e)).toList();
    listKompleks.value.sort((a, b) => a.id!.compareTo(b.id!));
  }

  fetchListMeneger() async {
    final json = await api.getall("meneger/v1/get");
    listMeneger.value = json.map((e) => Meneger.fromJson(e)).toList();
    listMeneger.value.sort((a, b) => a.id!.compareTo(b.id!));
  }

  fetchListMake() async {
    final json = await api.getall("make/v1/get");
    listMake.value = json.map((e) => Make.fromJson(e)).toList();
    listMake.value.sort((a, b) => a.id!.compareTo(b.id!));

  }

  fetchListjob() async {
    final json = await api.getall("job/v1/get");
    listJob.value = json.map((e) => Job.fromJson(e)).toList();
    listJob.value.sort((a, b) => a.id!.compareTo(b.id!));
  }

  fetchListnews() async {
    final json = await api.getall("news/v1/get");
    listnews.value = json.map((e) => News.fromJson(e)).toList();
    listnews.value.sort((a, b) => DateTime.parse(b.datacreate!)
        .compareTo(DateTime.parse(a.datacreate!)));
  }

  fetchEvent() async {
    final json = await api.getOne("event/v1/getone");
    events.value = Events.fromJson(json);
  }

  changeindexpage(int newindex) {
    indexpage.value = newindex;
    // notifyChildrens();
    update();
  }

  changeindextab(int newindex) {
    this.indextab.value = newindex;
    // notifyChildrens();

    update();
  }

  changeMake(Make newMake) {
    this.make = newMake;
  }

  changetitleKompleks(String title) {
    this.titleKompleks = title;
  }

  changePageKompleks(int i) {
    this.pageKomleks = i;
  }

  addOrder(Orderb order) {
    this.orderlist.add(order);
  }

  removeOrder(Orderb order) {
    this.orderlist.remove(order);
  }

  changeKompleks(Kompleks newkompleks) {
    this.kompleks = newkompleks;
    listImageDom.clear();
    {
      if (kompleks!.domSet!.length != 0) {
        for (Dom dom in kompleks!.domSet!) {
          for (ImageDom imageDom in dom.imageDataList!) {
            // if (imageDom.layout!) {
            listImageDom.add(imageDom);
            // }
          }
        }
      }
    }
    update();
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
  }
}
