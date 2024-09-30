import 'dart:convert';

import 'package:countries_world_map/countries_world_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegionsPage extends StatefulWidget {
  const RegionsPage({
    super.key,
  });

  @override
  State<RegionsPage> createState() => _RegionsPageState();
}

class _RegionsPageState extends State<RegionsPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'اختر المنطقة',
            style: TextStyle(fontFamily: "IBMPLEX"),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SimpleMap(
                    instructions: SMapSaudiArabia.instructions,
                    callback: (id, name, tapdetails) {
                      if ([
                        "SA-01",
                        "SA-02",
                        "SA-03",
                        "SA-04",
                        "SA-05",
                        "SA-06",
                        "SA-07",
                        "SA-08",
                        "SA-09",
                        "SA-10",
                        "SA-11",
                        "SA-12",
                        "SA-14"
                      ].contains(id)) {
                        Get.to(() => RegionPage(id));
                      }
                    },
                    colors: SMapSaudiArabiaColors(
                            sa01: Colors.amber,
                            sa02: Colors.lightBlueAccent,
                            sa03: Colors.indigoAccent,
                            sa04: Colors.orangeAccent,
                            sa05: Colors.orange,
                            sa06: Colors.deepOrangeAccent,
                            sa07: Colors.purple,
                            sa08: Colors.pink,
                            sa09: Colors.teal,
                            sa10: Colors.lime,
                            sa11: Colors.green,
                            sa12: Colors.deepPurple,
                            sa14: Colors.greenAccent)
                        .toMap()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color getRegionColor(String id) {
  switch (id) {
    case "SA-01":
      return Colors.amber;
    case "SA-02":
      return Colors.lightBlueAccent;
    case "SA-03":
      return Colors.indigoAccent;
    case "SA-04":
      return Colors.orangeAccent;
    case "SA-05":
      return Colors.orange;
    case "SA-06":
      return Colors.deepOrangeAccent;
    case "SA-07":
      return Colors.purple;
    case "SA-08":
      return Colors.pink;
    case "SA-09":
      return Colors.teal;
    case "SA-10":
      return Colors.lime;
    case "SA-11":
      return Colors.green;
    case "SA-12":
      return Colors.deepPurple;
    case "SA-14":
      return Colors.greenAccent;
    default:
      return Colors.grey;
  }
}

String getRegionName(String id) {
  switch (id) {
    case "SA-01":
      return "منطقة الرياض";
    case "SA-02":
      return "منطقة مكة المكرمة";
    case "SA-03":
      return "منطقة المدينة المنورة";
    case "SA-04":
      return "المنطقة الشرقية";
    case "SA-05":
      return "منطقة القصيم";
    case "SA-06":
      return "منطقة حائل";
    case "SA-07":
      return "منطقة تبوك";
    case "SA-08":
      return "منطقة الحدود الشمالية";
    case "SA-09":
      return "منطقة جازان";
    case "SA-10":
      return "منطقة نجران";
    case "SA-11":
      return "منطقة الباحة";
    case "SA-12":
      return "منطقة الجوف";
    case "SA-14":
      return "منطقة عسير";
    default:
      return "غير معروف";
  }
}

// SA-02 -> sa02
String makeIdDifferent(String id) => id.replaceAll("SA-", "sa");

class RegionPage extends StatefulWidget {
  const RegionPage(this.region, {super.key});

  final String region;

  @override
  State<RegionPage> createState() => _RegionPageState();
}

class _RegionPageState extends State<RegionPage> {
  Color? checkColor(colorID, Color color) {
    return colorID == widget.region.replaceAll("SA-", "sa") ? color : null;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.primary,
          // foregroundColor: Theme.of(context).colorScheme.onPrimary,
          centerTitle: true,
        ),
        // load data from json file
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('data.json'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = json.decode(snapshot.data.toString());
              var regionData = data[widget.region];

              return ListView(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      // border with darker region color
                      decoration: BoxDecoration(
                          color: getRegionColor(widget.region).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: getRegionColor(widget.region), width: 5)),
                      child: Text(
                        getRegionName(widget.region),
                        style: const TextStyle(
                            fontFamily: "IBMPLEX",
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  // the capital
                  ListTile(
                    title: const Text(
                      'العاصمة',
                      style: TextStyle(
                        fontFamily: "IBMPLEX",
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      regionData['capital'],
                      style: const TextStyle(
                          fontFamily: "IBMPLEX",
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SimpleMap(
                        instructions: SMapSaudiArabia.instructions,
                        fit: BoxFit.scaleDown,
                        colors: SMapSaudiArabiaColors(
                          sa01: checkColor("sa01", Colors.amber),
                          sa02: checkColor("sa02", Colors.lightBlueAccent),
                          sa03: checkColor("sa03", Colors.indigoAccent),
                          sa04: checkColor("sa04", Colors.orangeAccent),
                          sa05: checkColor("sa05", Colors.orange),
                          sa06: checkColor("sa06", Colors.deepOrangeAccent),
                          sa07: checkColor("sa07", Colors.purple),
                          sa08: checkColor("sa08", Colors.pink),
                          sa09: checkColor("sa09", Colors.teal),
                          sa10: checkColor("sa10", Colors.lime),
                          sa11: checkColor("sa11", Colors.green),
                          sa12: checkColor("sa12", Colors.deepPurple),
                          sa14: checkColor("sa14", Colors.greenAccent),
                          //WHERE IS 13 ?????!!!!!!!
                          //I SEE U M7MD >:(
                        ).toMap()),
                  ),
                  ExpansionTile(
                    title: const Text("المحافظات"),
                    leading: CircleAvatar(
                      backgroundColor: getRegionColor(widget.region),
                      // length of cities
                      child: Center(
                          child: Text(
                        regionData['cities'].length.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "IBMPLEX",
                          color: // change the color of the text based on the background color
                              getRegionColor(widget.region).computeLuminance() >
                                      0.5
                                  ? Colors.black
                                  : Colors.white,
                        ),
                      )),
                    ),
                    children: [
                      for (var city in regionData['cities'])
                        ListTile(
                          leading: Text(
                            "${regionData['cities'].indexOf(city) + 1}",
                            style: TextStyle(
                                fontFamily: "IBMPLEX",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: getRegionColor(widget.region)),
                          ),
                          trailing: (city['name'] == regionData['capital'])
                              ? Icon(Icons.star,
                                  color: getRegionColor(widget.region))
                              : null,
                          title: Text(
                            city['name'],
                            style: const TextStyle(
                              fontFamily: "IBMPLEX",
                            ),
                          ),
                        )
                    ],
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
