import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class CurrrentLocation extends StatefulWidget {
  const CurrrentLocation({super.key});

  @override
  State<CurrrentLocation> createState() => _CurrrentLocationState();
}

class _CurrrentLocationState extends State<CurrrentLocation> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  bool isDestinationSet = false;
  late Location _destinationLocation =
      Location(latitude: 0, longitude: 0, timestamp: DateTime.now());
  Position position = Position(
      longitude: -122.085749655962,
      latitude: 37.42796133580664,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0);
  final TextEditingController _searchcontroller = TextEditingController();
  Future<List<Location>> getLocationLatLng(String address) async {
    List<Location> locations = await locationFromAddress(address);
    return locations;
  }

  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyDJu89H8BuFgVRPmlEAEhO4RJ8ym7Wf85I";

  // late GoogleMapController googleMapController;

  static const CameraPosition initialPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  @override
  void initState() {
    super.initState();
    _determinelocation().then((value) => {
          setState(() => {position = value})
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User location'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              controller: _searchcontroller,
              textCapitalization: TextCapitalization.words,
              onChanged: (value) {
                print(value);
              },
              decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: IconButton(
                      onPressed: () async {
                        print('i work here');
                        List<Location> locations =
                            await getLocationLatLng(_searchcontroller.text);

                        setState(() {
                          _destinationLocation = locations[0];
                          isDestinationSet = true;
                        });

                        await Future.delayed(const Duration(seconds: 5));
                        _getPolyline();
                      },
                      icon: const Icon(Icons.search))),
            ),
          ),
          const SizedBox(height: 10,),
          Text('Distance: ${Geolocator.distanceBetween(position.latitude, position.longitude, _destinationLocation.latitude, _destinationLocation.longitude)}'),
          // print(distanceInMeters);
          const SizedBox(height: 10,),

          Expanded(
            child: GoogleMap(
              initialCameraPosition: initialPosition,
              // markers: markers,
              zoomControlsEnabled: true,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                _addMarker(LatLng(position.latitude, position.longitude),
                    'ytfde', BitmapDescriptor.defaultMarker);
              },
              markers: Set<Marker>.of(markers.values),
              polylines: Set<Polyline>.of(polylines.values),
              
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 14,
            )));

            _addMarker(LatLng(position.latitude, position.longitude), 'ytfde',
                BitmapDescriptor.defaultMarker);

            setState(() {});
          },
          label: const Text('Get Location!')),
    );
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
    setState(() {});
  }

  _addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    print(
        'Hello World this is the beginning of the blahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');
    print(PointLatLng(position.latitude, position.longitude));
    print(PointLatLng(
        _destinationLocation.latitude, _destinationLocation.longitude));
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(position.latitude, position.longitude),
        PointLatLng(
            _destinationLocation.latitude, _destinationLocation.longitude),
        travelMode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);

    var rng = Random();
    int randomNumber = rng.nextInt(100000000);
    _addMarker(
        LatLng(_destinationLocation!.latitude, _destinationLocation!.longitude),
        'marker-$randomNumber',
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet));

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }
    _addPolyLine();
  }



  // Future<void> _goToLocation() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }

  //Getting the current location
  Future<Position> _determinelocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('Location permissions are permanently denied.');
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
