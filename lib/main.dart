import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Accessibility Map'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(78.3839, 17.537537),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/nehachekuri/cl0t6d5zu00eu14qibq8vwlqv/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibmVoYWNoZWt1cmkiLCJhIjoiY2wwdDVnMGN3MGEzcDNjbHpibDB0azhuYiJ9.L8sXbuA3jW0iCl9_b5jG9g",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoibmVoYWNoZWt1cmkiLCJhIjoiY2wwdDVnMGN3MGEzcDNjbHpibDB0azhuYiJ9.L8sXbuA3jW0iCl9_b5jG9g',
                'id': 'mapbox.mapbox-streets-v8',
              },
              // subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: latLng.LatLng(78.3839, 17.537537),
                  builder: (ctx) => Container(
                    child: FlutterLogo(),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
