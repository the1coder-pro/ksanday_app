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
          title: const Text('اختر المنطقة'),
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
                      Get.to(() => RegionPage(id));
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

class RegionPage extends StatefulWidget {
  const RegionPage(this.region, {super.key});

  final String region;

  @override
  State<RegionPage> createState() => _RegionPageState();
}

class _RegionPageState extends State<RegionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.region),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        centerTitle: true,
      ),
      // load data from json file
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('data.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = json.decode(snapshot.data.toString());
            var regionData = data[widget.region];
            print(data);
            print(regionData);

            return ListView(
              children: [
                Text(
                  regionData['name'],
                  style: TextStyle(fontSize: 40),
                ),
                // the capital
                ListTile(
                  title: const Text('العاصمة'),
                  subtitle: Text(regionData['capital']),
                ),
                for (var city in regionData['cities'])
                  ListTile(
                    title: Text(city['name']),
                  )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
