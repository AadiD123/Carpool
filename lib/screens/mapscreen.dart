import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              SearchMapPlaceWidget(
                hasClearButton: true,
                placeType: PlaceType.address,
                placeholder: 'Where To?',
                apiKey: 'AIzaSyDVq6v2yFwAJ9i2guTT48zJ4BPXsaXu1SI',
                onSelected: (Place place) async {
                  Geolocation geolocation = await place.geolocation;
                  mapController.animateCamera(
                    CameraUpdate.newLatLng(geolocation.coordinates),
                  );
                  mapController.animateCamera(
                      CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 500,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(47.6, -122.190),
                      zoom: 14,
                    ),
                    mapType: MapType.normal,
                    compassEnabled: true,
                    myLocationEnabled: true,
                    zoomControlsEnabled: true,
                    buildingsEnabled: true,
                    myLocationButtonEnabled: true,
                    minMaxZoomPreference: MinMaxZoomPreference(5, 30),
                    mapToolbarEnabled: true,
                    rotateGesturesEnabled: true,
                    onMapCreated: (GoogleMapController googleMapController) {
                      setState(() {
                        mapController = googleMapController;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
