import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  final Map<String, Marker> _markers = {};

  GoogleMapController mapController;
  LatLng center = const LatLng(45.521563, -122.677433);
  TextEditingController searchLoc = TextEditingController();

  Future<void> _onMapCreated(GoogleMapController controller) async {
    LatLng myLoc = await _getCurrentLocation(geolocator);
    setState(() => {
          print(
              "Hopefully resetting map at ${myLoc.toString()}, not at ${center.toString()}"),
          center = myLoc
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  myLocationButtonEnabled: true,
                  initialCameraPosition:
                      CameraPosition(target: center, zoom: 10.0),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black87),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 30, 10, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    new Flexible(
                      child: TextField(
                        controller: searchLoc,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(5),
                          hintText: "Enter a city",
                        ),
                      ),
                    ),
                    new Flexible(
                        child: ElevatedButton(
                            onPressed: () => findBurrito(searchLoc.text),
                            child: Text("FIND")))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void findBurrito(String location) {
  print("Searching for 'Chipotles' near ${location}");
}

Future<LatLng> _getCurrentLocation(Geolocator geolocator) async {
  LatLng myLoc;
  await geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
      .then((Position position) {
    myLoc = new LatLng(position.latitude, position.longitude);
  });
  return myLoc;
}
