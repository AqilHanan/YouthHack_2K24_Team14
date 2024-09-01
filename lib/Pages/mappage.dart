import 'package:flutter/material.dart';

class LocationData {
  final String id;
  final String name;
  final int xCoordinate;
  final int yCoordinate;
  final String strnum;

  LocationData({
    required this.id,
    required this.name,
    required this.xCoordinate,
    required this.yCoordinate,
    required this.strnum,
  });
}

class MapMarker extends StatelessWidget {
  final String id;
  final String name;
  final Color color;
  final String strnum;
  final VoidCallback onTap;

  MapMarker({
    required this.id,
    required this.name,
    required this.color,
    required this.strnum,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Text(
            strnum,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<LocationData> locations = [
    LocationData(
      id: '1',
      name: 'Jurong East',
      xCoordinate: 210,
      yCoordinate: 300,
      strnum: '1',
    ),
    LocationData(
      id: '2',
      name: 'Jl kuokh Rc',
      xCoordinate: 300,
      yCoordinate: 280,
      strnum: '2',
    ),
    LocationData(
      id: '3',
      name: 'Tampines CC',
      xCoordinate: 140,
      yCoordinate: 290,
      strnum: '3',
    ),
    // Add more locations as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              panEnabled: true, // Enable panning
              scaleEnabled: true, // Enable zooming
              minScale: 0.5, // Minimum zoom level
              maxScale: 2.0, // Maximum zoom level
              onInteractionStart: (details) {
                // Handle interaction start
              },
              onInteractionUpdate: (details) {
                // Handle interaction update
              },
              onInteractionEnd: (details) {
                // Handle interaction end
              },
              child: Stack(
                children: [
                  Image.asset('lib/images/sgmap.jpg'),
                  ...locations.map((location) {
                    return Positioned(
                      left: location.xCoordinate.toDouble(),
                      top: location.yCoordinate.toDouble(),
                      child: MapMarker(
                        id: location.id,
                        name: location.name,
                        color: Colors.blue, // Customize marker color
                        strnum: location.strnum,
                        onTap: () {
                          if (location.strnum == '1') {
                          } else {}
                        },
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Exit'),
            ),
          ),
        ],
      ),
    );
  }
}
